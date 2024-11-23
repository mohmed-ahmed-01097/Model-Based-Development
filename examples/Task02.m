% MATLAB Script: Data Handling and Interpolation
% Author: [Your Name]
% Date: [Today's Date]
% Description: This script reads voltage and current data from an Excel file,
% performs interpolation, generates an interactive plot, and saves results
% to text files.

% Clear the workspace and command window
clear;
clc;

% 1. Read Data from Excel File
try
    % Specify the Excel file name
    filename = 'voltage_current_data.xlsx'; % Replace with the actual file name
    
    % Read the table from the Excel file
    data = readtable(filename);
    
    % Extract voltage and current columns
    voltage = data.Voltage; % Ensure column names match your Excel file
    current = data.Current;
catch ME
    % Handle errors during file reading
    fprintf('Error reading data from Excel file: %s\n', ME.message);
    return;
end

% 2. Clean the Data (Remove NaN Values)
try
    % Track original NaN indices
    original_nan_indices = isnan(voltage) | isnan(current);

    % Remove rows with NaN values in Voltage or Current
    finite_mask = isfinite(voltage) & isfinite(current);
    cleaned_voltage = voltage(finite_mask);
    cleaned_current = current(finite_mask);
    
    % Ensure voltage values are monotonically increasing
    [cleaned_voltage, sort_idx] = sort(cleaned_voltage); % Sort voltage data
    cleaned_current = cleaned_current(sort_idx);         % Reorder current values
catch ME
    fprintf('Error cleaning data: %s\n', ME.message);
    return;
end

% 3. Define the Interpolation Range and Step Size
interp_range = -17.3:0.1:0.9;

% 4. Perform Interpolation
try
    % Perform linear interpolation
    interp_current = interp1(cleaned_voltage, cleaned_current, interp_range, 'linear');
catch ME
    % Handle errors during interpolation
    fprintf('Error during interpolation: %s\n', ME.message);
    return;
end

% 5. Identify and Save Missing Data Points
missing_data = interp_range(isnan(interp_current)); % Missing data points (NaN)
% Fill missing data using linear interpolation
filled_voltage = fillmissing(data.Voltage, 'linear'); % Interpolates missing voltage
filled_current = fillmissing(data.Current, 'linear'); % Interpolates missing current

% Save missing data points to a text file
missing_filename = 'missing_data.txt';
try
    if ~isempty(missing_data)
        fileID = fopen(missing_filename, 'w');
        fprintf(fileID, 'Original NaN Values in Data:\n');
        fprintf(fileID, 'Voltage: %s\n', num2str(nan_voltage'));
        fprintf(fileID, 'Current: %s\n\n', num2str(nan_current'));
        
        fprintf(fileID, 'Missing Data Points in Interpolation Range:\n');
        fprintf(fileID, '%s\n', num2str(missing_data'));
        fclose(fileID);
        fprintf('Missing data points saved to %s\n', missing_filename);
    else
        fprintf('No missing data points were found in the interpolation range.\n');
    end
catch ME
    fprintf('Error saving missing data: %s\n', ME.message);
end

% 6. Save Interpolated Data to a Text File
interp_data = [interp_range', interp_current']; % Combine range and results

interp_filename = 'interpolated_data.txt';
try
    writematrix(interp_data, interp_filename, 'Delimiter', 'tab');
    fprintf('Interpolated data saved to %s\n', interp_filename);
catch ME
    fprintf('Error saving interpolated data: %s\n', ME.message);
end

% 7. Generate Interactive Plot
try
    % Plot the interpolated data
    figure;
    plot(filled_voltage, filled_current, 'bo-', 'DisplayName', 'Original Data');
    hold on;
    plot(interp_range, interp_current, 'r-', 'LineWidth', 1.5, 'DisplayName', 'Interpolated Data');
    xlabel('Voltage');
    ylabel('Interpolated Current');
    title('Data Handling and Interpolation');
    legend('Location', 'best');
    grid on;
    
    % Enable interactive data cursor mode
    datacursormode on;
    fprintf('Interactive plot generated.\n');
catch ME
    fprintf('Error generating plot: %s\n', ME.message);
end

% End of script
fprintf('Data Handling and Interpolation completed successfully.\n');
