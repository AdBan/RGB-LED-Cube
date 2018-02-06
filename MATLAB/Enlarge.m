function Enlarge(serial, figure, plotOn)
%Enlarge Makes Enlarge animation
    
    size = 8;
    DiscreteCubeRGB = zeros(size, size, size, 3);
    RED = 1; GREEN = 2; BLUE = 3;   %color indexes in three dimensional matrixes
    
    for howManyTimes = 1 : 5
        colorsMatrix = randi(2,1,3) - 1;
        if (colorsMatrix == 0)
            colorsMatrix = [1 0 0]; % if colorMatrix was empty just hardcode red 
        end
        
        for iter = 0 : 8
            enlarge = zeros(size, size, size);
            switch (iter)
                case 0
                    enlarge = zeros(size, size, size);
                case 1
                    enlarge(4:5,4:5,4:5) = 1;
                case 2
                    enlarge(3:6,3:6,3:6) = 1;
                case 3
                    enlarge(2:7,2:7,2:7) = 1;
                case 4
                    enlarge(1:8,1:8,1:8) = 1;
                case 5
                    enlarge(2:7,2:7,2:7) = 1;
                case 6
                    enlarge(3:6,3:6,3:6) = 1;
                case 7
                    enlarge(4:5,4:5,4:5) = 1;
                case 8 
                    enlarge = zeros(size, size, size);
            end

            %if color is enabled copy enlarge animation to its matrix dimension
            if (colorsMatrix(RED) == true)
                DiscreteCubeRGB(:,:,:,RED) = enlarge;
            end
            if (colorsMatrix(GREEN) == true)
                DiscreteCubeRGB(:,:,:,GREEN) = enlarge;
            end
            if (colorsMatrix(BLUE) == true)
                DiscreteCubeRGB(:,:,:,BLUE) = enlarge;
            end

            CubeData = DiscreteCubeRGB_To_CubeData(DiscreteCubeRGB);

            %if plot is enabled, plot data
            if (plotOn)
                PlotCubeData(CubeData, figure);
            end
            SendCubeData(serial, CubeData);

            %if plot is disabled, wait for some time
            if (~plotOn)
                pause(0.1);
            end
        end
    end
   
end

