clear 
clc

mass = linspace(1,10,5);
for i = 1:numel(mass)
    MassValue = mass(i);
    res = sim("sim_Ex3.slx");
    plot(res.logsout.get('x').Values);
    legendCells{i} = "m = " + MassValue;
    hold on;
end
legend(legendCells);