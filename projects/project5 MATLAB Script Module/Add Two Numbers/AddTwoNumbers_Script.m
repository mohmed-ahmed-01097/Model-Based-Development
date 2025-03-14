close all
clear
clc

mdl = 'Add_Two_Numbers';
new_system(mdl);
open_system(mdl);

%%
subsys_Name = 'Add Two';
subsys = [mdl '/' subsys_Name];
add_block('built-in/Subsystem', subsys);
add_block('simulink/Sources/In1', [subsys '/Number 1']);
add_block('simulink/Sources/In1', [subsys '/Number 2']);
add_block('simulink/Math Operations/Add', [subsys '/sum']);
add_block('simulink/Sinks/Out1', [subsys '/Summation']);

add_line(subsys, 'Number 1/1', 'sum/1');
add_line(subsys, 'Number 2/1', 'sum/2');
add_line(subsys, 'sum/1', 'Summation/1');

set_param(subsys, 'Position', [125, 100, 250, 200]);
set_param([subsys '/Number 1'], 'Position', [30, 40, 60, 60]);
set_param([subsys '/Number 2'], 'Position', [30, 90, 60, 110]);
set_param([subsys '/sum'], 'Position', [120, 20, 150, 125]);
set_param([subsys '/Summation'], 'Position', [200, 65, 230, 85]);

set_param(subsys, 'Mask', 'on');
set_param(subsys, 'MaskDescription', 'SubSystem To add two numbers');
set_param(subsys, 'MaskType', 'AddTwoNumbersSubSystemBlock');
set_param(subsys, 'MaskDisplay', 'disp("Add Two Nums")');

%%

add_block('simulink/Sources/Ramp', [mdl '/Num 1']);
add_block('simulink/Sources/Step', [mdl '/Num 2']);
add_block('simulink/Sinks/Scope', [mdl '/scope']);

add_line(mdl, 'Num 1/1', [subsys_Name '/1']);
add_line(mdl, 'Num 2/1', [subsys_Name '/2']);
add_line(mdl, [subsys_Name '/1'], 'scope/1');

set_param([mdl '/Num 1'], 'Slope', '1');
set_param([mdl '/Num 1'], 'Start', '0');
set_param([mdl '/Num 1'], 'InitialOutput', '0');

set_param([mdl '/Num 2'], 'Before', '5');
set_param([mdl '/Num 2'], 'After', '0');
set_param([mdl '/Num 2'], 'SampleTime', '5');

set_param([mdl '/Num 1'], 'Position', [30, 100, 70, 150]);
set_param([mdl '/Num 2'], 'Position', [30, 155, 70, 195]);
set_param([mdl '/scope'], 'Position', [300, 125, 350, 170]);

%%
% Save and Simulate
save_system(mdl);
sim(mdl);