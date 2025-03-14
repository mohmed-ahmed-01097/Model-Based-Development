% Practical Lab 1: Simulink Control System Project
close all
clear
clc

Kp = 1;
Ki = 1;
Kd = 0.1;

% Step 1: Create a New Simulink Model
mdl = 'ControlSystemProject';
new_system(mdl);       % Create a new model
open_system(mdl);      % Open the newly created model

%%
sunSysName = 'IdealPIDSubsystem';
subSys = [mdl '/' sunSysName];
% Step 2: Add Blocks to the Model
add_block('simulink/Sources/Step', [mdl '/Step']); % Step block
add_block('simulink/Continuous/Transfer Fcn', [mdl '/Transfer Function']); % Transfer Function block
add_block('simulink/Sinks/Scope', [mdl '/Scope']); % Scope block
add_block('simulink/Commonly Used Blocks/Sum', [mdl '/Sum'],'Inputs', '|+-');
add_block('built-in/SubSystem', subSys); % Add the PID Subsystem block

% Proportional Integral Derivative Path
add_block('simulink/Commonly Used Blocks/Gain', [subSys '/Proportional']); % Proportional block
add_block('simulink/Commonly Used Blocks/Gain', [subSys '/Integral Gain']); % Integral gain block
add_block('simulink/Continuous/Integrator', [subSys '/Integrator']); % Integrator block
add_block('simulink/Commonly Used Blocks/Gain', [subSys '/Derivative Gain']); % Derivative gain block
add_block('simulink/Continuous/Derivative', [subSys '/Derivative']); % Derivative block

% Sum Block
add_block('simulink/Commonly Used Blocks/Sum', [subSys '/Sum'],'Inputs', '+++'); % Sum block for P, I, D paths

% Input and Output Ports
add_block('simulink/Sources/In1', [subSys '/Input']); % Input port
add_block('simulink/Sinks/Out1', [subSys '/Output']); % Output port

%%
% Step 3: Connect Blocks with Lines
add_line(mdl, 'Step/1', 'Sum/1','autorouting','smart');        % Step to Transfer Function
add_line(mdl, 'Sum/1', 'Transfer Function/1','autorouting','smart');
add_line(mdl, 'Transfer Function/1', [sunSysName '/1'],'autorouting','smart'); % Transfer Function to PID Controller
add_line(mdl, [sunSysName '/1'], 'Scope/1','autorouting','smart');         % PID Controller to Scope
add_line(mdl, [sunSysName '/1'], 'Sum/2','autorouting','smart');

add_line(subSys, 'Input/1', 'Proportional/1');
add_line(subSys, 'Proportional/1', 'Integral Gain/1');
add_line(subSys, 'Integral Gain/1', 'Integrator/1');
add_line(subSys, 'Proportional/1', 'Derivative Gain/1');
add_line(subSys, 'Derivative Gain/1', 'Derivative/1');

% Connect P, I, D paths to Sum block
add_line(subSys, 'Proportional/1', 'Sum/1');
add_line(subSys, 'Integrator/1', 'Sum/2');
add_line(subSys, 'Derivative/1', 'Sum/3');

% Sum block to Output
add_line(subSys, 'Sum/1', 'Output/1');

%%
% Step 4: Set Block Parameters
% Configure the Transfer Function block (e.g., 1/(s+1))
set_param([mdl '/Transfer Function'], 'Numerator', '[1]', 'Denominator', '[1 1]');

% Configure the PID Controller block
% Link mask parameters to block parameters
set_param([subSys '/Proportional'], 'Gain', 'Kp'); % Link Kp
set_param([subSys '/Integral Gain'], 'Gain', 'Ki'); % Link Ki
set_param([subSys '/Derivative Gain'], 'Gain', 'Kd'); % Link Kd

Color(mdl);
Color(subSys);

% Create the mask
Simulink.Mask.create(subSys);
maskObj = Simulink.Mask.get(subSys); % Access the mask object

% Add mask parameters for Kp, Ki, and Kd
maskObj.addParameter('Name', 'Kp', 'Type', 'edit', 'Prompt', 'Proportional Gain (Kp):', 'Value', num2str(Kp));
maskObj.addParameter('Name', 'Ki', 'Type', 'edit', 'Prompt', 'Integral Gain (Ki):', 'Value', num2str(Ki));
maskObj.addParameter('Name', 'Kd', 'Type', 'edit', 'Prompt', 'Derivative Gain (Kd):', 'Value', num2str(Kd));
set_param(subSys, 'MaskDisplay', 'disp("PID")');

% Step 5: Simulate the Model
simOut = sim(mdl);    % Simulate the model

% Step 6: Open the Model for Inspection
Simulink.BlockDiagram.arrangeSystem(mdl);
Simulink.BlockDiagram.arrangeSystem(subSys);
open_system(mdl);     % Reopen the model for inspection

% Step 7: Save and Close the Model
save_system(mdl);     % Save the model
close_system(mdl);    % Close the model
