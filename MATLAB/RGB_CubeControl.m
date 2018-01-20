clc; clear;                     %clear previous data
s = SerialOpen(250000, 8, 2);   %initialize serial for UART communication

RED = 1; GREEN = 2; BLUE = 3;   %color indexes in three dimensional matrixes
Z = zeros(8, 8, 3);
DiscreteCubeRGB = zeros(8, 8, 8, 3);
F = CreateFigure(1, 'RGB Cube visualisation');

while (1)
    %Enlarge
    for iter = 0 : 8
        DiscreteCubeRGB(:,:,:,BLUE) = Enlarge(iter);
        CubeData = DiscreteCubeRGB_To_CubeData(DiscreteCubeRGB);
        F = PlotCubeData(CubeData, F);
        SendCubeData(s, CubeData);
    end
    
    %SineWave
    for phase = -1*pi:0.1:1*pi
        Z(:,:,RED) = SineWave(phase);

        DiscreteCubeRGB = Z_To_DiscreteCubeRGB(Z);
        CubeData = DiscreteCubeRGB_To_CubeData(DiscreteCubeRGB);
        F = PlotCubeData(CubeData, F);
        SendCubeData(s, CubeData);
    end
end

