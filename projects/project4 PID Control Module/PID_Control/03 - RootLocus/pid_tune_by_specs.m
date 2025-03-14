function [Kp, Ki, Kd] = pid_tune_by_specs(Mp, Ts, plant, controller_type)
    % pid_tune_by_specs - Tune PID gains to meet specified Mp and Ts
    %
    % Inputs:
    %   Mp             - Maximum peak (percent, e.g., 10 for 10%)
    %   Ts             - Settling time (in seconds)
    %   plant          - Transfer function of the plant (tf object)
    %   controller_type - Type of controller ('P', 'PI', 'PID')
    %
    % Outputs:
    %   Kp - Proportional gain
    %   Ki - Integral gain (returned as 0 if not applicable)
    %   Kd - Derivative gain (returned as 0 if not applicable)
    
    % Validate controller_type
    if ~ismember(controller_type, {'P', 'PI', 'PID'})
        error("Invalid controller type. Use 'P', 'PI', or 'PID'.");
    end

    % Convert Mp from percentage to damping ratio (zeta)
    zeta = -log(Mp / 100) / sqrt(pi^2 + (log(Mp / 100))^2);

    % Calculate natural frequency (wn) from settling time (Ts)
    wn = 4 / (zeta * Ts);

    % Calculate damped natural frequency (Wd)
    wd = wn * sqrt(1 - zeta^2);

    % Damping line angle
    phi = acos(zeta); % Angle with real axis

    % Compute root locus points for a range of gains
    poles = rlocus(plant, linspace(0, 100, 100000)); % Adjust gain range as needed
    
    % Find intersection points
    poles_desired = []; % Initialize array to store desired poles
    for i = 1:size(poles, 2) % Iterate over gains
        for j = 1:size(poles, 1) % Iterate over poles at each gain
            pole_angle = pi - abs(angle(poles(j, i))); % Compute pole angle
            if abs(pole_angle - phi) < 0.0001 % Check if angle matches damping line (tolerance = 0.01 rad)
                poles_desired = [poles_desired; poles(j, i)]; % Store matching pole
            end
        end
    end
    
    % Display intersection points
    disp('Desired Poles:');
    disp(poles_desired);

    % Plot the root locus of the plant
    figure;
    rlocus(plant);
    hold on;

    if ~isempty(poles_desired)
        plot(real(poles_desired), imag(poles_desired), 'ro', 'LineWidth', 2); % Highlight intersections
    end
    
    % Annotate damping ratio lines for reference
    max_real = max(abs(pole(plant))) * 2; % Adjust based on planttem poles
    x_upper = linspace(-max_real, 0, 500); % Real axis range
    y_upper = tan(phi) * abs(x_upper); % Upper damping line
    y_lower = -y_upper; % Lower damping line
    plot(x_upper, y_upper, 'r--', 'LineWidth', 1.5); % Upper line
    plot(x_upper, y_lower, 'r--', 'LineWidth', 1.5); % Lower line
    
    % Annotate
    title('Root Locus with Damping Ratio Lines and Intersection Points');
    xlabel('Real Axis');
    ylabel('Imaginary Axis');
    grid on;
    hold off;

    % Initial guesses and bounds based on controller type
    switch controller_type
        case 'P'
            initial_gains = 1;
            lb = 0;
        case 'PI'
            initial_gains = [1, 1];
            lb = [0, 0];
        case 'PID'
            initial_gains = [1, 1, 1];
            lb = [0, 0, 0];
    end

    % Optimize PID gains
    options = optimoptions('fmincon', 'Display', 'off');
    gains = fmincon(@(x) pid_error(x, plant, poles_desired, controller_type), ...
                    initial_gains, [], [], [], [], lb, [], [], options);

    % Assign gains based on controller type
    Kp = gains(1);
    Ki = 0;
    Kd = 0;
    if strcmp(controller_type, 'PI') || strcmp(controller_type, 'PID')
        Ki = gains(2);
    end
    if strcmp(controller_type, 'PID')
        Kd = gains(3);
    end

    % Simulate and verify the design
    [Mp_measured, Ts_measured] = simulate_and_verify(plant, Kp, Ki, Kd);

    % Display iteration result
    fprintf('Measured Mp = %.2f%%, Measured Ts = %.2fs\n', Mp_measured, Ts_measured);
end

function [Mp_measured, Ts_measured] = simulate_and_verify(plant, Kp, Ki, Kd)
    % simulate_and_verify - Simulates and checks if the design meets Mp and Ts
    %
    % Inputs:
    %   plant   - Plant transfer function
    %   Kp, Ki, Kd - PID gains
    %
    % Outputs:
    %   Mp_measured - Measured overshoot (%)
    %   Ts_measured - Measured settling time (s)

    s = tf('s');
    C = Kp + Ki / s + Kd * s;
    G_cl = feedback(C * plant, 1);

    % Step response
    [y, t] = step(G_cl); % Finer time steps for better accuracy

    final_value = y(end);  % Final value of the step response

    % Measure Mp (Overshoot)
    peak = max(y);
    Mp_measured = (peak - final_value) * 100; % Convert to percentage
    
    % Measure Ts (Settling Time)
    tolerance = 0.02 * final_value;  % 2% tolerance for settling time
    
    % Find the last time index when the response is within the tolerance band (2% of final value)
    Ts_measured_idx = find(abs(y - final_value) <= tolerance, 1, 'last');
    if ~isempty(Ts_measured_idx)
        Ts_measured = t(Ts_measured_idx);
    else
        Ts_measured = NaN;  % In case the response does not settle within the tolerance
    end
end

function error = pid_error(gains, plant, poles_desired, controller_type)
    % pid_error - Computes error between desired and actual poles for a PID controller
    %
    % Inputs:
    %   gains          - Array containing controller gains
    %   plant          - Transfer function of the plant
    %   poles_desired  - Desired closed-loop poles
    %   controller_type - Type of controller ('P', 'PI', 'PID')
    %
    % Outputs:
    %   error - Sum of distances between actual and desired poles

    % Extract gains based on controller type
    Kp = gains(1);
    Ki = 0;
    Kd = 0;
    if strcmp(controller_type, 'PI') || strcmp(controller_type, 'PID')
        Ki = gains(2);
    end
    if strcmp(controller_type, 'PID')
        Kd = gains(3);
    end

    % Define PID controller
    s = tf('s');
    C = Kp;
    if Ki > 0
        C = C + Ki / s;
    end
    if Kd > 0
        C = C + Kd * s;
    end

    % Closed-loop transfer function
    G_cl = feedback(C * plant, 1);

    % Compute actual poles
    poles_actual = pole(G_cl);

    % Match the number of poles (truncate if necessary)
    num_poles = min(length(poles_actual), length(poles_desired));
    poles_actual = poles_actual(1:num_poles);
    poles_desired = poles_desired(1:num_poles);

    % Calculate scalar error as the sum of squared magnitudes of pole differences
    error = sum(sum(abs(poles_actual - poles_desired).^2));
end
