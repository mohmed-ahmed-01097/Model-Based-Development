function [] = FirstOrderNew()
    % Parameters
    t = 0:0.1:10; % Time vector
    K = linspace(1, 5, 5); % Gain values
    T = linspace(0.01, 1, 5); % Time constants

    % Analyze each input type
    AnalyzeInput(K, T, 'Step');
    AnalyzeInput(K, T, 'Ramp');
    AnalyzeInput(K, T, 'Parabolic');
end

function [] = AnalyzeInput(K, T, inputType)
    % Define the base transfer function and scaling for each input type
    switch inputType
        case 'Step'
            scalingTF = 1; % No modification for step input
        case 'Ramp'
            scalingTF = tf([0 1], [1 0]); % Divide by s
        case 'Parabolic'
            scalingTF = tf([0 0 1], [1 0 0]); % Divide by s^2
    end

    % Plot responses for varying time constants (T)
    figure;
    legendStr = cell(1, length(T));
    for i = 1:length(T)
        G = tf([0 K(1)], [T(i) 1]) * scalingTF; % Apply the scaling for the input type
        step(G, 0:0.1:10); % Compute step response
        hold on;
        legendStr{i} = "T = " + T(i);
    end
    title(['Response to ' inputType ' Input (Varying T, K = ' num2str(K(1)) ')']);
    xlabel('Time (s)');
    ylabel('Output');
    legend(legendStr);
    grid on;

    % Plot responses for varying gains (K)
    figure;
    legendStr = cell(1, length(K));
    for i = 1:length(K)
        G = tf([0 K(i)], [T(1) 1]) * scalingTF; % Apply the scaling for the input type
        step(G, 0:0.1:10); % Compute step response
        hold on;
        legendStr{i} = "K = " + K(i);
    end
    title(['Response to ' inputType ' Input (Varying K, T = ' num2str(T(1)) ')']);
    xlabel('Time (s)');
    ylabel('Output');
    legend(legendStr);
    grid on;
end
