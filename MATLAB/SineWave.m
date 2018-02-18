function SineWave(serial, fig, plotOn)
%SineWave Makes SineWave animation

    size = 8;
    sineWave = zeros(size, size);
    [X,Y] = meshgrid(1:8,1:8);
    RED = 1; GREEN = 2; BLUE = 3;   %color indexes in three dimensional matrixes
    
    for phase = -5*pi : pi/30 : 5*pi
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
            %PlotCubeData(CubeData, fig);
            cla;
            redChannel = zeros(8,8); greenChannel = zeros(8,8); blueChannel = zeros(8,8);
            figure(fig);
            if (colorsMatrix(RED) == true)
                redChannel = ones(8,8);
            end
            if (colorsMatrix(GREEN) == true)
                greenChannel = ones(8,8);
            end
            if (colorsMatrix(BLUE) == true)
                blueChannel = ones(8,8);
            end
            
            colors = double(cat(3, redChannel, greenChannel, blueChannel));
            
            if (sum(sum(sum(Z(:,:,RED)))) > 0)
                surf(X,Y,Z(:,:,RED), colors);
            elseif (sum(sum(sum(Z(:,:,GREEN)))) > 0)
                surf(X,Y,Z(:,:,GREEN), colors);
            elseif (sum(sum(sum(Z(:,:,BLUE)))) > 0)
                surf(X,Y,Z(:,:,BLUE), colors);
            end
            axis([1 8 1 8 1 8]);
            axis('square');
            drawnow;
        else
            pause(0.01);
        end
        SendCubeData(serial, CubeData);
    end
end

