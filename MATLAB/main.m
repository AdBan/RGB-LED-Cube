clc; clear;                     %clear previous data
s = SerialOpen(250000, 8, 2);   %initialize serial for UART communication
F = CreateFigure(1, 'RGB Cube visualisation');
plotOn = false;                 %is plotting enabled?

while (1)
    Enlarge(s, F, plotOn);
    SineWave(s, F, plotOn);
    WallsMoving(s, F, plotOn);
    Rain(s, F, plotOn);
    
    %pause(3);
end

