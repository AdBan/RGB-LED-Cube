function F = PlotCubeData( CubeData, F )
%PlotCubeData Creates figure F based on input CubeData

    cla(F);                                     %clear axes before plotting anything            
    RED = 1; GREEN = 2; BLUE = 3;
    size = 8;
    [X,Y] = meshgrid(size:-1:1, 1:size);        %grid of cube base dimension (8x8)
    
    binaryCubeData = d2b(CubeData);             %get binary representation of CubeData
    for row = 1 : 8  
        plot3(X, Y, binaryCubeData((row-1)*size + 1 : row * size, :, RED) * row, 'ro');
        plot3(X, Y, binaryCubeData((row-1)*size + 1 : row * size, :, GREEN) * row, 'gs');      
        plot3(X, Y, binaryCubeData((row-1)*size + 1 : row * size, :, BLUE) * row, 'bx');
    end
    
    drawnow;                                    %update figure
end

