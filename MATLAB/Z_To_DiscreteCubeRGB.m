function DiscreteCubeRGB = Z_To_DiscreteCubeRGB( Z )
%Z_To_DiscreteCubeRGB Converts 8x8x3 Z-matrix to 8x8x8x3 DiscreteCubeRGB

    RED = 1; GREEN = 2; BLUE = 3;
    size = length(Z);
    DiscreteCubeRGB = zeros(size, size, size, 3); 

    %get DiscreteCubeRGB matrix representing cube levels
    for i = 1 : size
        for j = 1 : size
            if (Z(i, j, RED) > 0 )
                DiscreteCubeRGB(i, j, Z(i, j, RED), RED) = 1;
            end
            if (Z(i, j, GREEN) > 0 )
                DiscreteCubeRGB(i, j, Z(i, j, GREEN), GREEN) = 1;
            end
            if (Z(i, j, BLUE) > 0 )
                DiscreteCubeRGB(i, j, Z(i, j, BLUE), BLUE) = 1;
            end
        end
    end

end

