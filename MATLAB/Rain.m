function Rain(serial, figure, plotOn)
%Rain Makes Rain animation

    size = 8;
    RED = 1; GREEN = 2; BLUE = 3;   %color indexes in three dimensional matrixes
    xPos = randperm(8);
    yPos = randperm(8);
    
    Z = zeros(8,8,3);
    
    for i = 1:250
        randX = randi(8); randY = randi(8); randiZ = randi(3);
        if (Z(randX, randY, randiZ) == 0)
            Z(randX, randY, randiZ) = 8;
        end
        
        DiscreteCubeRGB = Z_To_DiscreteCubeRGB(Z);
        CubeData = DiscreteCubeRGB_To_CubeData(DiscreteCubeRGB);
        
        %if plot is enabled, plot data
        if (plotOn)
            PlotCubeData(CubeData, figure);
        end
        SendCubeData(serial, CubeData);
        Z(Z > 0) = Z(Z > 0) - 1;
        
        %if plot is disabled, wait for some time
        if (~plotOn)
            pause(0.05);
        end
    end
end

