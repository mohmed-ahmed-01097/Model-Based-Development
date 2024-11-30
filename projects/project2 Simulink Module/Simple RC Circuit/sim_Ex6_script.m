clear;
clc;

freq = linspace(10,60,6);
for i = 1:numel(freq)
    Freq = freq(i);
    res = sim("sim_Ex6.slx");
    plot(res.logsout.get("Vc").Values);
    legendStr{i} = "F = " + freq(i);
    hold on;
end
legend(legendStr);
ylabel("angular displacement");
xlabel("Time");