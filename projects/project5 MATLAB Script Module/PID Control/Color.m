function [] = Color(mdl)
% Color: Assigns background colors to blocks in a Simulink model based on block type.

% Find all blocks in the model
BlocksWithBlockTypeProperty = find_system(mdl, 'regexp', 'on', 'BlockType', '.*');
BlockTypes = get_param(BlocksWithBlockTypeProperty, 'BlockType');

% Loop through all blocks and assign colors based on block type
for index = 1:length(BlockTypes)
    switch BlockTypes{index}
        case 'Step'
            set_param(BlocksWithBlockTypeProperty{index}, 'BackgroundColor', 'Orange');
        case 'Gain'
            set_param(BlocksWithBlockTypeProperty{index}, 'BackgroundColor', 'Cyan');
        case 'UnitDelay'
            set_param(BlocksWithBlockTypeProperty{index}, 'BackgroundColor', 'Green');
        case 'Sum'
            set_param(BlocksWithBlockTypeProperty{index}, 'BackgroundColor', 'Magenta');
        case 'Derivative'
            set_param(BlocksWithBlockTypeProperty{index}, 'BackgroundColor', 'Blue');
        case 'Integrator'
            set_param(BlocksWithBlockTypeProperty{index}, 'BackgroundColor', 'Yellow');
        case 'Scope'
            set_param(BlocksWithBlockTypeProperty{index}, 'BackgroundColor', 'Gray');
        case 'TransferFcn'
            set_param(BlocksWithBlockTypeProperty{index}, 'BackgroundColor', 'Purple');
        case 'Inport'
            set_param(BlocksWithBlockTypeProperty{index}, 'BackgroundColor', 'LightBlue');
        case 'Outport'
            set_param(BlocksWithBlockTypeProperty{index}, 'BackgroundColor', 'Red');
        otherwise
            set_param(BlocksWithBlockTypeProperty{index}, 'BackgroundColor', 'White');
    end
    set_param(BlocksWithBlockTypeProperty{index}, 'ShowName', 'off');
end
end
