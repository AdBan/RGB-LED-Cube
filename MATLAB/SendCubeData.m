function SendCubeData( s, CubeData )
%SendCubeData Sends CubeData in R(64) -> G(64) -> R(64) order over serial s
    
    RED = 1; GREEN = 2; BLUE = 3;
    
    fwrite(s, CubeData(:, :, RED));
    fwrite(s, CubeData(:, :, GREEN));
    fwrite(s, CubeData(:, :, BLUE));
end

