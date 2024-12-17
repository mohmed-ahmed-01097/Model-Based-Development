function varargout = ARM(varargin)
% ARM MATLAB code for ARM.fig
%      ARM, by itself, creates a new ARM or raises the existing
%      singleton*.
%
%      H = ARM returns the handle to a new ARM or the handle to
%      the existing singleton*.
%
%      ARM('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ARM.M with the given input arguments.
%
%      ARM('Property','Value',...) creates a new ARM or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ARM_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ARM_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ARM

% Last Modified by GUIDE v2.5 22-Nov-2024 14:42:27

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ARM_OpeningFcn, ...
                   'gui_OutputFcn',  @ARM_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before ARM is made visible.
function ARM_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ARM (see VARARGIN)

% Choose default command line output for ARM
handles.output = hObject;

% Link sliders and edit boxes
handles.slider1 = findobj('Tag', 'slider1');
handles.slider2 = findobj('Tag', 'slider2');
handles.edit1 = findobj('Tag', 'edit1');
handles.edit2 = findobj('Tag', 'edit2');
handles.axes1 = findobj('Tag', 'axes1');

handles.angle1 = 0;
handles.angle2 = 0;

% Initialize slider values
set(handles.slider1, 'Value', 0);
set(handles.slider2, 'Value', 0);

% Update edit boxes to match initial slider values
set(handles.edit1, 'String', '0');
set(handles.edit2, 'String', '0');

% PID controller (auto-tuned or manual parameters)
PID.Kp = 1;      % Proportional gain
PID.Ki = 0.0005; % Integral gain
PID.Kd = 0.001;  % Derivative gain
PID.integral = 0;
PID.prev_error = 0;

handles.PID1 = PID;
handles.PID2 = PID;

% Initialize timer
handles.timer = timer(...
    'ExecutionMode', 'fixedRate', ...
    'Period', 0.75, ... % Update every 0.5 seconds
    'TimerFcn', @(src, event) updatePlot(hObject, event, guidata(hObject))); % Pass hObject and updated handles

% Save changes to handles structure
guidata(hObject, handles);
start(handles.timer);

% UIWAIT makes ARM wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ARM_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
sliderValue = get(hObject, 'Value');
set(handles.edit1, 'String', num2str(sliderValue));
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject, 'BackgroundColor'), get(0, 'defaultUicontrolBackgroundColor'))
    set(hObject, 'BackgroundColor', [.9 .9 .9]);
end


% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
sliderValue = get(hObject, 'Value');
set(handles.edit2, 'String', num2str(sliderValue));
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject, 'BackgroundColor'), get(0, 'defaultUicontrolBackgroundColor'))
    set(hObject, 'BackgroundColor', [.9 .9 .9]);
end


function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
editValue = str2double(get(hObject, 'String'));
if isnan(editValue) || editValue < -10 || editValue > 10
    % Revert to slider value if input is invalid
    editValue = get(handles.slider1, 'Value');
    set(hObject, 'String', num2str(editValue));
else
    % Update slider value
    set(handles.slider1, 'Value', editValue);
end
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
editValue = str2double(get(hObject, 'String'));
if isnan(editValue) || editValue < -10 || editValue > 10
    % Revert to slider value if input is invalid
    editValue = get(handles.slider2, 'Value');
    set(hObject, 'String', num2str(editValue));
else
    % Update slider value
    set(handles.slider2, 'Value', editValue);
end
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function figure1_CloseRequestFcn(hObject, eventdata, handles)
% Stop and delete the timer
if isfield(handles, 'timer') && isvalid(handles.timer)
    stop(handles.timer);
    delete(handles.timer);
end

% Close the GUI
delete(hObject);

function [x, y] = calc(x, y, r, a)
% Calculate endpoint of an arm segment
x = x + r * cos(a);
y = y + r * sin(a);

function [a1, a2] = getAngles(x, y, r)
u = atan2(x / r, y / r); % atan2 ensures correct quadrant for sin and cos ratio
cos_v = max(min(y / r / (2 * cos(u)), 1), -1); % Clamp cos_v to [-1, 1]
v = acos(cos_v); % Calculate v safely

% Calculate a1 and a2
a1 = u + v; % First angle
a2 = u - v; % Second angle
    
function new_angle = pidCalc(PID, current_angle, target_angle)
if abs(target_angle - current_angle) > abs(-2*pi+target_angle - current_angle)
    target_angle = -2*pi+target_angle;
end
% Calculate the next angle using PID control
error = target_angle - current_angle;
PID.integral = PID.integral + error;
derivative = error - PID.prev_error;

% Calculate PID output
pid_output = PID.Kp * error + PID.Ki * PID.integral + PID.Kd * derivative;

% Update the angle and limit changes
new_angle = current_angle + max(min(pid_output, 0.2), -0.2);
PID.prev_error = error;

function updatePlot(hObject, eventdata, handles)
% Get current slider values
y = get(handles.slider1, 'Value');
x = get(handles.slider2, 'Value');

[x2, y2] = calc( 0,  0, 10, handles.angle1);
[x3, y3] = calc(x2, y2, 10, handles.angle2);

% Check if the slider values changed
if x ~= x3 || y ~= y3
    [a1, a2] = getAngles(x, y, 10);
    handles.angle1 = pidCalc(handles.PID1, handles.angle1, a1);
    handles.angle2 = pidCalc(handles.PID2, handles.angle2, a2);
end

axes(handles.axes1); % Set focus to axes1
cla(handles.axes1); % Clear existing plot

% Plot the arms
plot(handles.axes1, [ 0, x2], [ 0, y2], 'b', 'LineWidth', 3);
hold(handles.axes1, 'on');
plot(handles.axes1, [x2, x3], [y2, y3], 'r', 'LineWidth', 3);
hold(handles.axes1, 'on');
plot(handles.axes1, x3, y3, 'ko', 'LineWidth', 5);
hold(handles.axes1, 'off');

% Configure axes appearance
xlabel(handles.axes1, 'X');
ylabel(handles.axes1, 'Y');
handles.axes1.XLim = [-25 25]; % Set X-axis limits
handles.axes1.YLim = [-25 25]; % Set Y-axis limits
handles.axes1.XAxisLocation = 'origin'; % Place X-axis at the origin
handles.axes1.YAxisLocation = 'origin'; % Place Y-axis at the origin
handles.axes1.XColor = [0.651 0.651 0.651]; % Gray color for X-axis
handles.axes1.YColor = [0.651 0.651 0.651]; % Gray color for Y-axis
handles.axes1.XGrid = 'on'; % Enable grid on X-axis
handles.axes1.YGrid = 'on'; % Enable grid on Y-axis

% Save the updated handles structure.
guidata(hObject, handles);
