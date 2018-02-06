function SineWave(serial, figure, plotOn)
%SineWave Makes SineWave animation

    size = 8;
    sineWave = zeros(size, size);
    %Z = zeros(size, size, 3);
    RED = 1; GREEN = 2; BLUE = 3;   %color indexes in three dimensional matrixes
    
    for phase = -10*pi : pi/30 : 10*pi
        if (mod(phase, pi) == 0)
            Z = zeros(size, size, 3);
            colorsMatrix = randi(2,1,3) - 1;
            if (colorsMatrix == 0)
                colorsMatrix = [1 0 0]; % if colorMatrix was empty just hardcode red 
            end
        end
        for i = 1:size
            for j = 1:size
                sineWave(i, j) = sin(phase + sqrt(MapValue(i, 1, size, -pi, pi)^2 + MapValue(j, 1, size, -pi, pi)^2));
                sineWave(i, j) = round(MapValue(sineWave(i, j), -1, 1, 1, size));
            end
        end
        
        %if color is enabled copy enlarge animation to its matrix dimension
        if (colorsMatrix(RED) == true)
        	Z(:,:,RED) = sineWave;
        end
        if (colorsMatrix(GREEN) == true)
        	Z(:,:,GREEN) = sineWave;
        end
        if (colorsMatrix(BLUE) == true)
        	Z(:,:,BLUE) = sineWave;
        end
        
        DiscreteCubeRGB = Z_To_DiscreteCubeRGB(Z);
        CubeData = DiscreteCubeRGB_To_CubeData(DiscreteCubeRGB);
        
        %if plot is enabled, plot data
        if (plotOn)
            PlotCubeData(CubeData, figure);
        end
        SendCubeData(serial, CubeData);
        
        %if plot is disabled, wait for some time
        if (~plotOn)
            pause(0.001);
        end
    end
    
    
end

