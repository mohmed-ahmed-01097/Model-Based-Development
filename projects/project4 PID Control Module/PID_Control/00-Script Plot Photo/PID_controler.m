function [] = PID_controller()
    % Parameters
    Kp = [0.001,0.01,0.1,0.5,1,5,10,50,100]; % Proportional gain values
    Ki = [0.001,0.01,0.1,0.5,1,5,10,50,100]; % Integral gain values
    Kd = [0.001,0.01,0.1,0.5,1,5,10,50,100]; % Derivative gain values

    Frist_Order_TF  = tf([0 1], [1 1]);
    Second_Order_TF = tf([0 0 1], [1 2 1]);

    % Analyze each input type
    AnalyzeInput('P'  , Frist_Order_TF , Kp);
    AnalyzeInput('P'  , Second_Order_TF, Kp);

    AnalyzeInput('I'  , Frist_Order_TF , Ki);
    AnalyzeInput('I'  , Second_Order_TF, Ki);

    AnalyzeInput('D'  , Frist_Order_TF , Kd);
    AnalyzeInput('D'  , Second_Order_TF, Kd);

    AnalyzeInput('PI' , Frist_Order_TF , Kp, Ki);
    AnalyzeInput('PI' , Second_Order_TF, Kp, Ki);

    AnalyzeInput('PD' , Frist_Order_TF, Kp, Kd);
    AnalyzeInput('PD' , Second_Order_TF, Kp, Kd);

    AnalyzeInput('PID', Frist_Order_TF , Kp, Ki, Kd);
    AnalyzeInput('PID', Second_Order_TF, Kp, Ki, Kd);
end

function [] = AnalyzeInput(inputType, G_S, varargin)
    t = 0:0.01:10; % Time vector
    fprintf('Analyzing %s controller:\n', inputType);

    switch inputType
        case 'P'
            % Proportional controller
            figure;
            Kp = varargin{1};
            legendStr = cell(1, length(Kp));
            for i = 1:length(Kp)
                scalingTF = Kp(i); % No modification for step input
                G = feedback(G_S * scalingTF, 1); % Apply the scaling for the input type
                step(G, t); % Compute step response
                hold on;
                legendStr{i} = "Kp = " + Kp(i);
            end
            title(['Analyzing ' inputType ' - controller (Varying Kp)']);
            xlabel('Time (s)');
            ylabel('Response');
            legend(legendStr, 'Location', 'best');
            h = findobj(gca, 'Type', 'line');
            set(h, 'LineWidth', 1.5);
            grid on;
        case 'I'
            % Integral controller
            figure;
            Ki = varargin{1};
            legendStr = cell(1, length(Ki));
            for i = 1:length(Ki)
                scalingTF = tf([0 Ki(i)], [1 0]); % Integral term (1/s)
                G = feedback(G_S * scalingTF, 1); % Apply the scaling for the input type
                step(G, t); % Compute step response
                hold on;
                legendStr{i} = "Ki = " + Ki(i);
            end
            title(['Analyzing ' inputType ' - controller (Varying Ki)']);
            xlabel('Time (s)');
            ylabel('Response');
            legend(legendStr, 'Location', 'best');
            h = findobj(gca, 'Type', 'line');
            set(h, 'LineWidth', 1.5);
            grid on;
        case 'D'
            % Derivative controller
            figure;
            Kd = varargin{1};
            legendStr = cell(1, length(Kd));
            for i = 1:length(Kd)
                scalingTF = tf([Kd(i) 0], [0 1]); % Derivative term (Kd * s)
                G = feedback(G_S * scalingTF, 1); % Apply the scaling for the input type
                step(G, t); % Compute step response
                hold on;
                legendStr{i} = "Kd = " + Kd(i);
            end
            title(['Analyzing ' inputType ' - controller (Varying Kd)']);
            xlabel('Time (s)');
            ylabel('Response');
            legend(legendStr, 'Location', 'best');
            h = findobj(gca, 'Type', 'line');
            set(h, 'LineWidth', 1.5);
            grid on;
        case 'PI'
            % Proportional-Integral controller
            figure;
            Kp = varargin{1};
            Ki = varargin{2};
            numRows = ceil(sqrt(length(Kp))); % Arrange subplots in a grid
            numCols = ceil(length(Kp) / numRows);
            for i = 1:length(Kp)
                subplot(numRows, numCols, i); % Create a subplot for each Kp
                legendStr = cell(1, length(Ki));
                for j = 1:length(Ki)
                    scalingTF_p = Kp(i); % Proportional term
                    scalingTF_i = tf([0 Ki(j)], [1 0]); % Integral term (1/s)
                    scalingTF = scalingTF_p * (1 + scalingTF_i); % Combine P and I
                    G = feedback(scalingTF * tf([1], [1, 1]), 1); % Closed-loop transfer function
                    step(G, t); % Compute step response
                    hold on;
                    legendStr{j} = sprintf('Ki = %.2f', Ki(j));
                end
                title(sprintf('PI Controller (Kp = %.2f)', Kp(i)));
                xlabel('Time (s)');
                ylabel('Response');
                legend(legendStr, 'Location', 'best');
                h = findobj(gca, 'Type', 'line');
                set(h, 'LineWidth', 1.5);
                grid on;
            end
        case 'PD'
            % Proportional-Derivative controller
            figure;
            Kp = varargin{1};
            Kd = varargin{2};
            numRows = ceil(sqrt(length(Kp))); % Arrange subplots in a grid
            numCols = ceil(length(Kp) / numRows);
            for i = 1:length(Kp)
                subplot(numRows, numCols, i); % Create a subplot for each Kp
                legendStr = cell(1, length(Kd));
                for j = 1:length(Kd)
                    scalingTF_p = Kp(i); % No modification for step input
                    scalingTF_d = tf([Kd(j) 0], [0 1]); % Derivative term (Kd * s)
                    scalingTF = scalingTF_p * (1 + scalingTF_d);
                    G = feedback(G_S * scalingTF, 1); % Apply the scaling for the input type
                    step(G, t); % Compute step response
                    hold on;
                    legendStr{j} = sprintf('Kd = %.2f', Kd(j));
                end
                title(sprintf('PD Controller (Kp = %.2f)', Kp(i)));
                xlabel('Time (s)');
                ylabel('Response');
                legend(legendStr, 'Location', 'best');
                h = findobj(gca, 'Type', 'line');
                set(h, 'LineWidth', 1.5);
                grid on;
            end
        case 'PID'
            % Proportional-Integral-Derivative controller
            Kp = varargin{1};
            Ki = varargin{2};
            Kd = varargin{3};
            numRows = ceil(sqrt(length(Kp))); % Arrange subplots in a grid
            numCols = ceil(length(Kp) / numRows);
            for i = 1:length(Kp)
                figure;
                for j = 1:length(Ki)
                    subplot(numRows, numCols, j); % Create a subplot for each Kp
                    legendStr = cell(1, length(Kd));
                    for k = 1:length(Kd)
                        scalingTF_p = Kp(i); % No modification for step input
                        scalingTF_i = tf([0 Ki(j)], [1 0]); % Integral term (1/s)
                        scalingTF_d = tf([Kd(k) 0], [0 1]); % Derivative term (Kd * s)
                        scalingTF = scalingTF_p * (1 + scalingTF_i + scalingTF_d);
                        G = feedback(G_S * scalingTF, 1); % Apply the scaling for the input type
                        step(G, t); % Compute step response
                        hold on;
                        legendStr{k} = sprintf('Kd = %.2f', Kd(k));
                    end
                    title(sprintf('PID Controller (Kp = %.2f,Ki = %.2f)', Kp(i), Ki(j)));
                    xlabel('Time (s)');
                    ylabel('Response');
                    legend(legendStr, 'Location', 'best', 'Location', 'best');
                    h = findobj(gca, 'Type', 'line');
                    set(h, 'LineWidth', 1.5);
                    grid on;
                end
            end
        otherwise
            error('Invalid input type');
    end
end
