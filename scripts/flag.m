% Colors
GreenColor = [0, 0.51, 0.25];
WhiteColor = [1, 1, 1];
BlackColor = [0, 0, 0];
RedColor = [0.898, 0.132, 0.203];
YellowColor = [1, 0.85, 0.35];

PosX = 100;
PosY = 200;
flagWidth = 800;
flagHeight = 500;

figure('Position', [PosX, PosY, flagWidth, flagHeight]);
rectangle('Position', [0, 2*(flagHeight/3), flagWidth, flagHeight/3], "FaceColor",BlackColor);
rectangle('Position', [0, 0               , flagWidth, flagHeight/3], "FaceColor",GreenColor);
regX = [0, 0        , flagWidth/2.5];
regY = [0, flagHeight, flagHeight/2];
hold on;
fill(regX, regY, RedColor);
% Enhance visualization
axis equal;
axis off;
hold off;


figure('Position', [PosX+flagWidth+100, PosY, flagWidth, flagHeight]);
rectangle('Position', [0, 2*(flagHeight/3), flagWidth, flagHeight/3], "FaceColor",RedColor);
rectangle('Position', [0, 0               , flagWidth, flagHeight/3], "FaceColor",BlackColor);

hold on;
eagleWidth = flagWidth / 10;
eagleHeight = flagHeight / 5;
eagleX = (flagWidth - eagleWidth) / 2;
eagleY = flagHeight / 3 + (flagHeight / 3 - eagleHeight) / 2;

rectangle('Position', [eagleX, eagleY, eagleWidth, eagleHeight], "FaceColor", YellowColor, "Curvature", [0.2, 0.2]);

% Enhance visualization
axis equal;
axis off;
hold off;