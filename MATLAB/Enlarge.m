function enlarge = Enlarge(iter)
%Enlarge Creates 8x8x8 DiscreteCube of Enlarge animation 
% USAGE:
%     for iter = 0 : 8
%         DiscreteCubeRGB(:,:,:,RED) = Enlarge(iter);
%         DiscreteCubeRGB(:,:,:,GREEN) = Enlarge(iter);
%         DiscreteCubeRGB(:,:,:,BLUE) = Enlarge(iter);
%         CubeData = DiscreteCubeRGB_To_CubeData(DiscreteCubeRGB);
%         SendCubeData(s, CubeData);
%         pause(.1)
%     end
    
    size = 8;
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
   
end

