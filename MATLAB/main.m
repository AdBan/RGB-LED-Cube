clc; clear;                     %clear previous data
s = SerialOpen(250000, 8, 2);   %initialize serial for UART communication
F = CreateFigure(1, 'RGB Cube visualisation');
plotOn = true;                  %is plotting enabled?

while(1)
    PolandBudget(s, F, plotOn);
    Magnetometer(s, F, plotOn);
    WEZUT(s, F, plotOn);
    Enlarge(s, F, plotOn);
    SineWave(s, F, plotOn);
    WallsMoving(s, F, plotOn);
    Rain(s, F, plotOn);
end