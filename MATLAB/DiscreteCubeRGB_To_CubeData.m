function CubeData = DiscreteCubeRGB_To_CubeData( DiscreteCubeRGB )
%DiscreteCubeRGB_To_CubeData Converts 8x8x8x3 DiscreteCubeRGB to 64x3
%CubeData

    RED = 1; GREEN = 2; BLUE = 3;
    size = length(DiscreteCubeRGB);
    CubeData = zeros(64,1,3);
    
    j = 1:size:57;
    for i = 1 : size
        %assign cubeData based on Z_Levels matrix
        CubeData(j(i) : i*size, 1, RED) = binaryVectorToDecimal(DiscreteCubeRGB(:,:,i, RED));
        CubeData(j(i) : i*size, 1, GREEN) = binaryVectorToDecimal(DiscreteCubeRGB(:,:,i, GREEN));
        CubeData(j(i) : i*size, 1, BLUE) = binaryVectorToDecimal(DiscreteCubeRGB(:,:,i, BLUE));
    end

end

