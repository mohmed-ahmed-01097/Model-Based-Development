classdef ARM_Rob < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure     matlab.ui.Figure
        GridLayout   matlab.ui.container.GridLayout
        LeftPanel    matlab.ui.container.Panel
        GridLayout2  matlab.ui.container.GridLayout
        TextArea1    matlab.ui.control.TextArea
        TextArea2    matlab.ui.control.TextArea
        Switch       matlab.ui.control.Switch
        Button       matlab.ui.control.Button
        Slider2      matlab.ui.control.Slider
        Slider1      matlab.ui.control.Slider
        RightPanel   matlab.ui.container.Panel
        GridLayout3  matlab.ui.container.GridLayout
        UIAxes       matlab.ui.control.UIAxes
    end

    % Properties that correspond to apps with auto-reflow
    properties (Access = private)
        onePanelWidth = 576;
    end

    

    % Callbacks that handle component events
    methods (Access = private)

        % Button down function: UIAxes
        function UIAxesButtonDown(app, event)
           
        end

        % Button pushed function: Button
        function ButtonPushed(app, event)
            hold(app.UIAxes, 'off');
            try
                delete(p1); delete(p2); delete(p3);
            catch
            end
            l1 = app.Slider1.Value;
            l2 = app.Slider2.Value;
            %theta1 = [linspace(0,180,1000) linspace(180,360,1000)];
            %theta2 = [linspace(0,360,1000) linspace(0,360,1000)];
            theta1 =  readmatrix('theta1.csv');
            theta2 =  readmatrix('theta2.csv');

            x2 = l1*cosd(theta1);
            y2 = l1*sind(theta1);
            x3 = x2+l2*cosd(theta1+theta2);
            y3 = y2+l2*sind(theta1+theta2);

            p1 = plot(app.UIAxes, [    0, x2(1)], [    0, y2(1)], 'b', 'LineWidth', 3);
            hold(app.UIAxes, 'on');
            p2 = plot(app.UIAxes, [x2(1), x3(1)], [y2(1), y3(1)], 'r', 'LineWidth', 3);
            hold(app.UIAxes, 'on');
            p3 = plot(app.UIAxes, x3(1), y3(1), 'ko', 'LineWidth', 5);

            plot(app.UIAxes, x3, y3);
            while (app.Switch.Value == "On")
                for i = 1:10:length(theta1)
                    delete(p1); delete(p2); delete(p3);
                    p1 = plot(app.UIAxes, [    0, x2(i)], [    0, y2(i)], 'b', 'LineWidth', 3);
                    %hold(app.UIAxes, 'on');
                    p2 = plot(app.UIAxes, [x2(i), x3(i)], [y2(i), y3(i)], 'r', 'LineWidth', 3);
                    %hold(app.UIAxes, 'on');     
                    p3 = plot(app.UIAxes, x3(i), y3(i), 'ko', 'LineWidth', 5);
                    %hold(app.UIAxes, 'off');
                    drawnow
                    pause(0.1)
                    if(app.Switch.Value ~= "On")
                        break;
                    end
                end
            end

        end

        % Value changed function: Slider2
        function Slider2ValueChanged(app, event)
            app.TextArea2.Value = {num2str(app.Slider2.Value)};           
        end

        % Value changed function: Slider1
        function Slider1ValueChanged(app, event)
            app.TextArea1.Value = {num2str(app.Slider1.Value)};          
        end

        % Changes arrangement of the app based on UIFigure width
        function updateAppLayout(app, event)
            currentFigureWidth = app.UIFigure.Position(3);
            if(currentFigureWidth <= app.onePanelWidth)
                % Change to a 2x1 grid
                app.GridLayout.RowHeight = {480, 480};
                app.GridLayout.ColumnWidth = {'1x'};
                app.RightPanel.Layout.Row = 2;
                app.RightPanel.Layout.Column = 1;
            else
                % Change to a 1x2 grid
                app.GridLayout.RowHeight = {'1x'};
                app.GridLayout.ColumnWidth = {288, '1x'};
                app.RightPanel.Layout.Row = 1;
                app.RightPanel.Layout.Column = 2;
            end
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.AutoResizeChildren = 'off';
            app.UIFigure.Position = [100 100 842 480];
            app.UIFigure.Name = 'MATLAB App';
            app.UIFigure.SizeChangedFcn = createCallbackFcn(app, @updateAppLayout, true);

            % Create GridLayout
            app.GridLayout = uigridlayout(app.UIFigure);
            app.GridLayout.ColumnWidth = {288, '1x'};
            app.GridLayout.RowHeight = {'1x'};
            app.GridLayout.ColumnSpacing = 0;
            app.GridLayout.RowSpacing = 0;
            app.GridLayout.Padding = [0 0 0 0];
            app.GridLayout.Scrollable = 'on';

            % Create LeftPanel
            app.LeftPanel = uipanel(app.GridLayout);
            app.LeftPanel.Layout.Row = 1;
            app.LeftPanel.Layout.Column = 1;

            % Create GridLayout2
            app.GridLayout2 = uigridlayout(app.LeftPanel);
            app.GridLayout2.RowHeight = {'1x', '1x', '10x', '1x'};
            app.GridLayout2.ColumnSpacing = 5.33333333333333;
            app.GridLayout2.Padding = [5.33333333333333 10 5.33333333333333 10];

            % Create Slider1
            app.Slider1 = uislider(app.GridLayout2);
            app.Slider1.Limits = [0 10];
            app.Slider1.Orientation = 'vertical';
            app.Slider1.ValueChangedFcn = createCallbackFcn(app, @Slider1ValueChanged, true);
            app.Slider1.Layout.Row = 3;
            app.Slider1.Layout.Column = 1;
            app.Slider1.Value = 5;

            % Create Slider2
            app.Slider2 = uislider(app.GridLayout2);
            app.Slider2.Limits = [0 10];
            app.Slider2.Orientation = 'vertical';
            app.Slider2.ValueChangedFcn = createCallbackFcn(app, @Slider2ValueChanged, true);
            app.Slider2.Layout.Row = 3;
            app.Slider2.Layout.Column = 2;
            app.Slider2.Value = 5;

            % Create Button
            app.Button = uibutton(app.GridLayout2, 'push');
            app.Button.ButtonPushedFcn = createCallbackFcn(app, @ButtonPushed, true);
            app.Button.Layout.Row = 2;
            app.Button.Layout.Column = 2;

            % Create Switch
            app.Switch = uiswitch(app.GridLayout2, 'slider');
            app.Switch.Layout.Row = 2;
            app.Switch.Layout.Column = 1;

            % Create TextArea2
            app.TextArea2 = uitextarea(app.GridLayout2);
            app.TextArea2.HorizontalAlignment = 'center';
            app.TextArea2.FontSize = 20;
            app.TextArea2.Layout.Row = 4;
            app.TextArea2.Layout.Column = 2;
            app.TextArea2.Value = {'5.0'};

            % Create TextArea1
            app.TextArea1 = uitextarea(app.GridLayout2);
            app.TextArea1.HorizontalAlignment = 'center';
            app.TextArea1.FontSize = 20;
            app.TextArea1.Layout.Row = 4;
            app.TextArea1.Layout.Column = 1;
            app.TextArea1.Value = {'5.0'};

            % Create RightPanel
            app.RightPanel = uipanel(app.GridLayout);
            app.RightPanel.Layout.Row = 1;
            app.RightPanel.Layout.Column = 2;

            % Create GridLayout3
            app.GridLayout3 = uigridlayout(app.RightPanel);
            app.GridLayout3.ColumnWidth = {'1x'};
            app.GridLayout3.RowHeight = {'1x'};
            app.GridLayout3.Padding = [2.5 5 2.5 5];

            % Create UIAxes
            app.UIAxes = uiaxes(app.GridLayout3);
            xlabel(app.UIAxes, 'X')
            ylabel(app.UIAxes, 'Y')
            zlabel(app.UIAxes, 'Z')
            app.UIAxes.XLim = [-25 25];
            app.UIAxes.YLim = [-25 25];
            app.UIAxes.XAxisLocation = 'origin';
            app.UIAxes.XColor = [0.651 0.651 0.651];
            app.UIAxes.YAxisLocation = 'origin';
            app.UIAxes.YColor = [0.651 0.651 0.651];
            app.UIAxes.ZColor = [0.651 0.651 0.651];
            app.UIAxes.XGrid = 'on';
            app.UIAxes.YGrid = 'on';
            app.UIAxes.Layout.Row = 1;
            app.UIAxes.Layout.Column = 1;
            app.UIAxes.ButtonDownFcn = createCallbackFcn(app, @UIAxesButtonDown, true);

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = ARM_Rob

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end