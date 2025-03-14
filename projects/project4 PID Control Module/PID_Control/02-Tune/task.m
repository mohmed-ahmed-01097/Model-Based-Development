function [] = task()
    clear; clc;

    figure;
    % Plant Parameters
    R = 1e3;
    C = 1e-6;
    % Define the transfer function of the plant
    num = [1];
    den = [1 1/(R*C)];
    G = tf(num, den);
    
    System_Plot(G, 'First Order System R1 = 1k - C1 = 1uF');

    figure;
    subplot(3, 1, 1);
    % Define the transfer function of the plant
    wn = 1;
    zeta = 0.5;
    num = [wn^2];
    den = [1 2*zeta*wn wn^2];
    G = tf(num, den);
    
    System_Plot(G, 'Second Order System - Underdamped System');

    subplot(3, 1, 2);
    % Define the transfer function of the plant
    wn = 1;
    zeta = 1.5;
    num = [wn^2];
    den = [1 2*zeta*wn wn^2];
    G = tf(num, den);
    
    System_Plot(G, 'Second Order System - Overdamped System');

    subplot(3, 1, 3);
    % Define the transfer function of the plant
    wn = 1;
    zeta = 1;
    num = [wn^2];
    den = [1 2*zeta*wn wn^2];
    G = tf(num, den);
    
    System_Plot(G, 'Second Order System - Critically Damped System');


end

%% Ziegler-Nichols Method
function [] = System_Plot(sys, plot_title)
    % Time vector
    t = 0:0.001:15;
    legend_Str = {};
    
    % Step response without controller
    step(sys, t);
    legend_Str{end + 1} = 'Without Controller';
    hold on;
    
    %%
    % Find L (delay time) and T (time constant)
    [L, T] = S_Shape(sys);  % Ensure this function is defined
    
    % Calculate PID parameters using S-Shape method
    Kp_ss = 1.2 * (T / L);
    Ti_ss = 2.0 * L;
    Td_ss = 0.5 * L;
    
    % Display PID parameters
    fprintf('S-Shape Method PID Tuning Parameters:\n');
    fprintf('Proportional Gain (Kp): %.3f\n', Kp_ss);
    fprintf('Integral Time (Ti): %.3f\n', Ti_ss);
    fprintf('Derivative Time (Td): %.3f\n', Td_ss);
    
    % Define PID controller for S-Shape method
    pid_ss = pid(Kp_ss, Kp_ss / Ti_ss, Kp_ss * Td_ss);
    
    % Simulate the closed-loop system with the PID controller
    closed_loop_ss = feedback(pid_ss * sys, 1);
    
    % Step response with S-Shape controller
    step(closed_loop_ss, t);
    legend_Str{end + 1} = 'With S-Shape Method PID Controller';
    hold on;

    %%
    try
    % Find the ultimate gain (Kcr) and ultimate period (Pcr)
    [Kcr, Pcr] = Ziegler(sys);  % Ensure this function is defined
    
    % Calculate PID parameters using Ziegler-Nichols method
    Kp_zn = 0.600 * Kcr;
    Ti_zn = 0.500 * Pcr;
    Td_zn = 0.125 * Pcr;
    
    % Display PID parameters
    fprintf('Ziegler-Nichols PID Tuning Parameters:\n');
    fprintf('Proportional Gain (Kp): %.3f\n', Kp_zn);
    fprintf('Integral Time (Ti): %.3f\n', Ti_zn);
    fprintf('Derivative Time (Td): %.3f\n', Td_zn);
    
    % Define PID controller for Ziegler-Nichols
    pid_zn = pid(Kp_zn, Kp_zn / Ti_zn, Kp_zn * Td_zn);
    
    % Simulate the closed-loop system with the PID controller
    closed_loop_zn = feedback(pid_zn * sys, 1);
    
    % Step response with Ziegler-Nichols controller
    step(closed_loop_zn, t);
    legend_Str{end + 1} = 'With Ziegler-Nichols PID Controller';
    end
    hold off;
    
    % Finalize plot
    title(plot_title);
    legend(legend_Str);
    grid on;
end