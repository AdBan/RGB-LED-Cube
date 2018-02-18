function DiscreteCubeRGB = SingleLED_On(DiscreteCubeRGB, row, column, level, colors)
%SingleLED_On Lights single LED in cubeData matrix

    size = 8;
    RED = 1; GREEN = 2; BLUE = 3;   %color indexes in three dimensional matrixes
    
    if (colors(RED))
        DiscreteCubeRGB(row, column, level, RED) = 1;
    end
    if (colors(GREEN))
        DiscreteCubeRGB(row, column, level, GREEN) = 1;
    end
    if (colors(BLUE))
        DiscreteCubeRGB(row, column, level, BLUE) = 1;
    end

end

