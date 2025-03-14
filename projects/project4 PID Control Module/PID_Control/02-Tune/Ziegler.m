function [Kcr, Pcr] = Ziegler(sys)
% Ziegler calculates the ultimate gain (Kcr) and ultimate period (Pcr)
% for a given system using the Ziegler-Nichols method.
%
% INPUT:
% sys - Transfer function or state-space representation of the system
%
% OUTPUT:
% Kcr - Ultimate gain, the proportional gain at which the system exhibits sustained oscillations
% Pcr - Ultimate period, the period of sustained oscillations
%
% This method applies a proportional controller to the system and increases
% the gain until sustained oscillations are observed.

% Initialize variables
Kcr = 0;              % Ultimate gain (Ku)
Pcr = 0;              % Ultimate period (Tu)
Kp = linspace(0.01, 10, 1000);  % Range of proportional gain values to test
tolerance = 1e-3;     % Tolerance to detect sustained oscillations
stable = true;        % Flag to check system stability

% Loop through proportional gain values
for i = 1:length(Kp)
    % Define the closed-loop system with proportional gain
    closed_loop = feedback(Kp(i) * sys, 1);
    
    % Compute step response
    [y, t] = step(closed_loop);
    
    % Check for instability (e.g., response blows up)
    if any(isnan(y)) || max(y) > 1e6
        stable = false;
        break;
    end
    
    % Detect sustained oscillations
    [pks, locs] = findpeaks(y, t);  % Find peaks in the step response
    if length(pks) > 1
        periods = diff(locs);  % Calculate the periods between consecutive peaks
        % Check if the periods are consistent (sustained oscillations)
        if all(abs(periods - mean(periods)) < tolerance)
            Kcr = Kp(i);       % Store the ultimate gain
            Pcr = mean(periods); % Calculate the ultimate period
            break;
        end
    end
end

% Display results or error message
if stable && Kcr > 0
    fprintf('Ultimate gain (Kcr): %.3f\n', Kcr);
    fprintf('Ultimate period (Pcr): %.3f\n', Pcr);
else
    error('System did not reach sustained oscillations within the search range.');
end

end
