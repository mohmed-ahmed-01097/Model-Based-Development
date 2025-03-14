function [L, T] = S_Shape(sys)
% S_Shape calculates the delay time (L) and time constant (T) 
% from the step response of a given system.
%
% INPUT:
% sys - Transfer function or state-space representation of the system
%
% OUTPUT:
% L - Delay time, the time when the step response begins to rise
% T - Time constant, the time taken to reach 63.2% of the final value
%
% The function assumes the system's response approximates an S-shaped curve
% commonly seen in first-order systems with delay.

% Obtain the step response of the system
% y: the step response values
% t: the corresponding time values
[y, t] = step(sys);

% Calculate the steady-state value of the step response
final_value = y(end);  % Final value after the system stabilizes

% Determine the delay time (L)
% The delay time is the point at which the response starts to rise significantly.
threshold_start = 0.01 * final_value;  % Define a threshold at 1% of the final value
L_index = find(y >= threshold_start, 1);  % Find the first index where the response exceeds the threshold
L = t(L_index);  % Get the time corresponding to the delay time

% Determine the time constant (T)
% The time constant is defined as the time taken to reach 63.2% of the steady-state value.
threshold_63 = 0.632 * final_value;  % Calculate 63.2% of the final value
T_index = find(y >= threshold_63, 1);  % Find the first index where the response reaches this threshold
T = t(T_index) - L;  % Subtract the delay time to calculate the time constant

% Display the calculated delay time and time constant
fprintf('Delay Time (L): %.3f seconds\n', L);
fprintf('Time Constant (T): %.3f seconds\n', T);

end
