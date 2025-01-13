clear; clc;
% PID Tuning using Root Locus in MATLAB
R1 = 1e6; 
R2 = 1e6; 
C1 = 1e-7; 
C2 = 1e-7;
num = [1/(R1*R2*C1*C2)];
den = [1 (R1*C1+R2*C2+R1*C2)/(R1*R2*C1*C2) 1/(R1*R2*C1*C2)]; 

G = tf(num, den);

% Desired specifications
Mp = 10;  % Maximum peak in percent
Ts = 2;   % Settling time in seconds

% Display the plant transfer function
disp('Plant Transfer Function:');
display(G);

% Design PID controller
% Tune PID gains
[Kp, Ki, Kd] = pid_tune_by_specs(Mp, Ts, G, 'P');

% Define the PID controller transfer function
% PID controller structure: C(s) = Kp + Ki/s + Kd*s
s = tf('s'); % Define the Laplace variable
C = Kp + Ki/s + Kd*s; % PID controller

% Combine the PID controller with the plant
G_ol = C * G; % Open-loop transfer function with PID
G_cl = feedback(G_ol, 1);

% Plot root locus of the closed-loop system
figure;
rlocus(G_ol);
title('Root Locus with PID Controller');
grid on;

% Display tuned controller
fprintf('Tuned PID Controller Gains:\n');
fprintf('Kp = %.2f\n', Kp);
fprintf('Ki = %.2f\n', Ki);
fprintf('Kd = %.2f\n', Kd);

figure;
legend_Str = {};
step(G);
legend_Str{end + 1} = 'Without Controller';
hold on;
step(G_cl);
legend_Str{end + 1} = 'With Controller and feedback';

title('Step Response with Tuned PID Controllers');
legend(legend_Str);
grid on;
