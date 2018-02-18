function Magnetometer(serial, figure, plotOn)

    Z = [ 8.2 8.4 8.9 9.4 10.3 9.2 8.6 7.8; ...
        8.2 10.1 11.7 13.1 15.3 13.2 12.1 10; ...
        11.2 14.8 18 19.4 19.7 19.7 18.9 15.9; ...
        14.9 19.6 31.7 39.5 43.5 51.7 37.8 24.6; ...
        18.6 31.9 65.7 85 84.8 82.2 63.7 33.2; ...
        21.9 34.7 64.5 77.6 95.7 94.4 71.4 39; ...
        21.8 34 50.3 60.3 61.9 59.7 51.4 37; ...
        22 34.9 51.5 60.5 61.6 60.8 53.3 39.8];

    zMax = max(max(Z)); zMin = min(min(Z));
    [X,Y] = meshgrid(1:8, 1:8);
    RED = 1; BLUE = 3; GREEN = 2;
    Zout = zeros(8,8,3);
    
    for i = 1 : size(Z,1)
        for j = 1 : size(Z,2)
            val = round(MapValue(Z(i,j), zMin, zMax, 1, 8));
            if (val > 4)
                Zout(i, j, RED) = val;
            else
                Zout(i, j, BLUE) = val;
            end
        end
    end
    
    DiscreteCubeRGB = Z_To_DiscreteCubeRGB(Zout);   
    CubeData = DiscreteCubeRGB_To_CubeData(DiscreteCubeRGB);

    %if plot is enabled, plot data
    if (plotOn)
        %PlotCubeData(CubeData, figure);
        redChannel = zeros(8,8); greenChannel = zeros(8,8); blueChannel = zeros(8,8);
        redChannel(Zout(:,:,RED) > 0) = 1;
        blueChannel(Zout(:,:,BLUE) > 0) = 1;
        colors = double(cat(3, redChannel, greenChannel, blueChannel));
        surf(X,Y,Z, colors);
        axis([1 8 1 8 1 max(max(Z))]);
        axis('square');
    end
    SendCubeData(serial, CubeData);
    
    pause(5);
    %restore default axis limits 
    axis([1 8 1 8 1 8]);
    axis('square');
end

