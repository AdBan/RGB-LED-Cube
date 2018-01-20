function sineWave = SineWave(phase)
%SineWave Creates 8x8 Z-matrix of 3D sine wave
% USAGE:
%{
     for phase = -pi:0.1:pi
         Z(:,:,RED) = SineWave(phase);
         Z(:,:,GREEN) = SineWave(phase);
         Z(:,:,BLUE) = SineWave(phase);

         DiscreteCubeRGB = Z_To_DiscreteCubeRGB(Z);
         CubeData = DiscreteCubeRGB_To_CubeData(DiscreteCubeRGB);
         PlotZ(X,Y,Z);
         SendCubeData(s, CubeData);
     end
%}

    size = 8;
    sineWave = zeros(size, size);
    
    for i = 1:size
        for j = 1:size
            sineWave(i, j) = sin(phase + sqrt(MapValue(i, 1, size, -pi, pi)^2 + MapValue(j, 1, size, -pi, pi)^2));
            sineWave(i, j) = round(MapValue(sineWave(i, j), -1, 1, 1, size));
        end
    end
    
end

