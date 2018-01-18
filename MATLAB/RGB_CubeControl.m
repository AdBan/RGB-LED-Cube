clc; clear;
s = SerialOpen(250000, 8, 2);

RED = 1; GREEN = 2; BLUE = 3;   %color indexes in three+ dimensional matrixes
[X,Y] = meshgrid(1:8, 1:8); %cube base dimension (8x8)
Z = zeros(8, 8, 3);
DiscreteCubeRGB = zeros(8, 8, 8, 3);

%available animations: SineWave, 

while (1)
    for iter = 0 : 8
        DiscreteCubeRGB(:,:,:,RED) = Enlarge(iter);
        DiscreteCubeRGB(:,:,:,GREEN) = Enlarge(iter);
        DiscreteCubeRGB(:,:,:,BLUE) = Enlarge(iter);
        CubeData = DiscreteCubeRGB_To_CubeData(DiscreteCubeRGB);
        SendCubeData(s, CubeData);
        pause(.1)
    end
end

