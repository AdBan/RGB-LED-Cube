function WEZUT(serial, figure, plotOn)
%WEZUT Makes WE ZUT text

    size = 8;
    RED = 1; GREEN = 2; BLUE = 3;   %color indexes in three dimensional matrixes
    DiscreteCubeRGB = zeros(size, size, size, 3);
    foreground = [0 1 0];
    background = [1 0 0];
    
    %% make letters
    %vertical
    for i = 2 : size
        %W
        DiscreteCubeRGB = SingleLED_On(DiscreteCubeRGB, 1, 6, i, foreground);
        DiscreteCubeRGB = SingleLED_On(DiscreteCubeRGB, 1, 2, i, foreground);
        %E
        DiscreteCubeRGB = SingleLED_On(DiscreteCubeRGB, 2, 1, i, foreground);
    end
    
    %horizontal
    for i = 2 : 5
        %E
        DiscreteCubeRGB = SingleLED_On(DiscreteCubeRGB, i, 1, 8, foreground);
        DiscreteCubeRGB = SingleLED_On(DiscreteCubeRGB, i, 1, 5, foreground);
        DiscreteCubeRGB = SingleLED_On(DiscreteCubeRGB, i, 1, 2, foreground);
    end
    
    %single points
    %W
    DiscreteCubeRGB = SingleLED_On(DiscreteCubeRGB, 1, 3, 3, foreground);
    DiscreteCubeRGB = SingleLED_On(DiscreteCubeRGB, 1, 4, 4, foreground);
    DiscreteCubeRGB = SingleLED_On(DiscreteCubeRGB, 1, 5, 3, foreground);
    
    % shift letters
    for iter = 1 : 40
        DiscreteCubeRGB_tempShift = DiscreteCubeRGB;

        for i = 2 : size
            DiscreteCubeRGB(1, i, :, :) = DiscreteCubeRGB_tempShift(1, i - 1, :, :);
            DiscreteCubeRGB(i, 8, :, :) = DiscreteCubeRGB_tempShift(i - 1, 8, :, :);
        end
        for i = 7 : -1 : 1
            DiscreteCubeRGB(8, i, :, :) = DiscreteCubeRGB_tempShift(8, i + 1, :, :);
            DiscreteCubeRGB(i, 1, :, :) = DiscreteCubeRGB_tempShift(i + 1, 1, :, :);
        end

        % color everything else as background
        for row = 1 : size
            for column = 1 : size
                for level = 1 : size
                    if (DiscreteCubeRGB(row, column, level, RED) == 0 && ...
                    DiscreteCubeRGB(row, column, level, GREEN) == 0 && ...
                    DiscreteCubeRGB(row, column, level, BLUE) == 0)
                        DiscreteCubeRGB = SingleLED_On(DiscreteCubeRGB, row, column, level, background);
                    end
                end
            end
        end


        % plot and send
        cubeData = DiscreteCubeRGB_To_CubeData(DiscreteCubeRGB);
        
        %if plot is enabled, plot data
        if (plotOn)
            PlotCubeData(cubeData, figure);
        else
            pause(0.5);
        end

        SendCubeData(serial, cubeData);
    end
    
end

