function [] = SecondOrderNew()
    % Parameters
    t = 0:0.1:10; % Time vector
    W_n  = linspace(1,5,5); % Natural Frequancy
    Zeta = linspace(0,2,5); % Damping Constant

    % Analyze each input type
    AnalyzeInput(W_n, Zeta, 'Step');
    AnalyzeInput(W_n, Zeta, 'Ramp');
    AnalyzeInput(W_n, Zeta, 'Parabolic');
end

function [] = AnalyzeInput(W, Z, inputType)
    % Define the base transfer function and scaling for each input type
    switch inputType
        case 'Step'
            scalingTF = 1; % No modification for step input
        case 'Ramp'
            scalingTF = tf([0 1], [1 0]); % Divide by s
        case 'Parabolic'
            scalingTF = tf([0 0 1], [1 0 0]); % Divide by s^2
    end

    % Plot responses for varying Damping constants (T)
    figure;
    legendStr = cell(1, length(Z));
    for i = 1:length(Z)
        G = tf([0 1], [1 (2*Z(i)) 1]) * scalingTF; % Apply the scaling for the input type
        step(G, 0:0.1:10); % Compute step response
        hold on;
        legendStr{i} = "(\zeta) = " + Z(i);
    end
    title(['Response to ' inputType ' Input (Varying \zeta, \omega_n = 1)']);
    xlabel('Time (s)');
    ylabel('Output');
    legend(legendStr);
    grid on;

    % Plot responses for varying Natural Frequancy (K)
    figure;
    legendStr = cell(1, length(W));
    for i = 1:length(W)
        G = tf([0 W(i)^2], [1 (2*W(i)) W(i)^2]) * scalingTF; % Apply the scaling for the input type
        step(G, 0:0.1:10); % Compute step response
        hold on;
        legendStr{i} = "(\omega_n) = " + W(i);
    end
    title(['Response to ' inputType ' Input (Varying \omega_n, \zeta = 1)']);
    xlabel('Time (s)');
    ylabel('Output');
    legend(legendStr);
    grid on;
end
