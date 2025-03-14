function [] = SecondOrder()

t = 0:0.1:10;
stepInput = (t > 1.0) * 1; 
rampInput = 0.1 * t;
parbInput = 0.01 * t.^2;

PlotTransferFunction(stepInput, t);
PlotTransferFunction(rampInput, t);
PlotTransferFunction(parbInput, t);

function [] = PlotTransferFunction(input, time)
figure;
j = 1;
W_n = 1;
Zeta = linspace(0,2,5);
for i = 1:length(Zeta)
    num = [0 W_n(1)^2];
    den = [1 (2*W_n(1)*Zeta(i)) W_n(1)^2];
    G = tf(num, den); 
    [y_ramp,t_ramp] = lsim(G,input,time);
    plot(t_ramp,y_ramp);
    legandStr{j} = "(\zeta) = " + Zeta(i);
    j = j + 1;
    hold on;
end
legend(legandStr);

figure;
j = 1;
Zeta = 1;
W_n  = linspace(1,5,5);
for i = length(W_n):-1:1
    num = [0 W_n(i)^2];
    den = [1 (2*W_n(i)*Zeta) W_n(i)^2];
    G = tf(num, den);
    [y_ramp,t_ramp] = lsim(G,input,time);
    plot(t_ramp,y_ramp);
    legandStr{j} = "(\omega_n) = " + W_n(i);
    j = j + 1;
    hold on;
end
legend(legandStr);
stepinfo(G);
