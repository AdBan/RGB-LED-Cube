function CubeData = DiscreteCubeRGB_To_CubeData( DiscreteCubeRGB )
%DiscreteCubeRGB_To_CubeData Converts 8x8x8x3 DiscreteCubeRGB to 64x3
%CubeData

    RED = 1; GREEN = 2; BLUE = 3;
    CubeData = zeros(64,1,3);
    
    CubeData(:, :, RED) = b2d(DiscreteCubeRGB(:, :, :, RED));
    CubeData(:, :, GREEN) = b2d(DiscreteCubeRGB(:, :, :, GREEN));
    CubeData(:, :, BLUE) = b2d(DiscreteCubeRGB(:, :, :, BLUE));

end

