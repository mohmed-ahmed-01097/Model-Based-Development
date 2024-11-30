clear;
clc;

LengthArray = linspace(1, 10, 5);
for i = 1:numel(LengthArray)
    L = LengthArray(i);
    res = sim("sim_Ex5.slx");
    plot(res.logsout.get("theta").Values);
    legendStr{i} = "L = " + L;
    hold on;
end
legend(legendStr);
ylabel("angular displacement");
xlabel("Time");