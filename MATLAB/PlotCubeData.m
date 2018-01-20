function F = PlotCubeData( CubeData, F )
%PlotCubeData Creates figure F based on input CubeData

    cla(F);                                     %clear axes before plotting anything            
    RED = 1; GREEN = 2; BLUE = 3;
    cubeSize = 8;
    [X,Y] = meshgrid(1:cubeSize, 1:cubeSize);   %grid of cube base dimension (8x8)
    
    binaryCubeData = d2b(CubeData);             %get binary representation of CubeData
    
    for row = 1 : 8
        plot3(X, Y, binaryCubeData((row-1)*cubeSize + 1 : row * cubeSize, :, RED) * row, 'ro');
        plot3(X, Y, binaryCubeData((row-1)*cubeSize + 1 : row * cubeSize, :, GREEN) * row, 'gs');
        plot3(X, Y, binaryCubeData((row-1)*cubeSize + 1 : row * cubeSize, :, BLUE) * row, 'bx');
    end
    drawnow;                                    %update figure
end

