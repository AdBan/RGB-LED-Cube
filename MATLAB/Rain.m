function Rain(serial, figure, plotOn)
%Rain Makes Rain animation

    Z = zeros(8,8,3);
    
    for i = 1:150
        randX = randi(8); randY = randi(8); randiZ = randi(3);
        if (Z(randX, randY, randiZ) == 0)
            Z(randX, randY, randiZ) = 8;
        end
        
        DiscreteCubeRGB = Z_To_DiscreteCubeRGB(Z);
        CubeData = DiscreteCubeRGB_To_CubeData(DiscreteCubeRGB);
        
        %if plot is enabled, plot data
        if (plotOn)
            PlotCubeData(CubeData, figure);
        else
            pause(0.05);
        end
        SendCubeData(serial, CubeData);
        Z(Z > 0) = Z(Z > 0) - 1;
    end
end

