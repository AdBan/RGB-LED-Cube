function F = PlotCubeData( CubeData, F )
%PlotCubeData Creates figure F based on input CubeData

    cla(F);                                     %clear axes before plotting anything            
    RED = 1; GREEN = 2; BLUE = 3;
    size = 8;
    [X,Y] = meshgrid(size:-1:1, 1:size);        %grid of cube base dimension (8x8)
    
    binaryCubeData = d2b(CubeData);             %get binary representation of CubeData

%without colors like magenta yellow etc. - faster!
    for row = 1 : 8  
        plot3(X, Y, binaryCubeData((row-1)*size + 1 : row * size, :, RED) * row, 'ro');
        plot3(X, Y, binaryCubeData((row-1)*size + 1 : row * size, :, GREEN) * row, 'gx');      
        plot3(X, Y, binaryCubeData((row-1)*size + 1 : row * size, :, BLUE) * row, 'bs');
    end

%with colors like magenta yellow etc. - slower!
%     for level = 0 : 7
%         for column = 1 : 8
%             for row = 1 : 8  
%                 ColorSpecification = [ binaryCubeData(8*level + row, column, RED) binaryCubeData(8*level + row, column, GREEN) binaryCubeData(8*level + row, column, BLUE) ];
%                 plot3(X(row, column), Y(row, column), 1 * (level+1), 'o', 'MarkerFaceColor', ColorSpecification, 'MarkerEdgeColor', [ 0 0 0 ]);
%             end
%         end
%     end
    
    drawnow;                                    %update figure
end

