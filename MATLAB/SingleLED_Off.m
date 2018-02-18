function DiscreteCubeRGB = SingleLED_Off(DiscreteCubeRGB, row, column, level, colors)
%SingleLED_On Switches off single LED in cubeData matrix

    size = 8;
    RED = 1; GREEN = 2; BLUE = 3;   %color indexes in three dimensional matrixes
    DiscreteCubeRGB = zeros(size, size, size, 3); 
    
    if (colors(RED))
        DiscreteCubeRGB(row, column, level, RED) = 0;
    end
    if (colors(GREEN))
        DiscreteCubeRGB(row, column, level, GREEN) = 0;
    end
    if (colors(BLUE))
        DiscreteCubeRGB(row, column, level, BLUE) = 0;
    end

end

