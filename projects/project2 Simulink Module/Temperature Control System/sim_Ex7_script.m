clear;
clc;
step = linspace(5,10,5);
figure;
for i = 1:numel(step)
    Ku = 1;
    tu = step(i);
    res = sim("sim_Ex7.slx");
    plot(res.logsout.get("T_t").Values);
    legendStr{i} = "tu = " + tu;
    hold on;
end
legend(legendStr);
step = linspace(1,2,5);
figure;
for i = 1:numel(step)
    tu = 10;
    Ku = step(i);
    res = sim("sim_Ex7.slx");
    plot(res.logsout.get("T_t").Values);
    legendStr{i} = "Ku = " + Ku;
    hold on;
end
legend(legendStr);