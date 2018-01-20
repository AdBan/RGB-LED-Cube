function b = d2b(x)
% Convert a decimal number into a binary array. Works for matrixes up to 3
% dimensions

    inputRows = size(x,1);  % in case input is 2 dim. matrix eg. zeros(2,2)
    inputPages = size(x,3); % in case input is multipage eg. zeros(2,2,2)
    cubeSize = 8;           % cube size, for mine: 8x8x8
    b = zeros(inputRows, cubeSize, inputPages);
    
    if (x == 0)
        return;
    elseif (x == 1)
        b = [0 0 0 0 0 0 0 1];
        return;
    end

    for page = 1 : inputPages
        if (inputRows < 2)
            % input is single number eg. zeros(1,1)
            c = floor(log2(x)) + 1; % Number of divisions necessary
            for i = 1:c
                r = floor(x / 2);
                b(8+1-i) = x - 2*r;
                x = r;
            end
        else
            %array [ dec;
            %        dec ]
            for i = 1 : inputRows
                b(i, :, page) = d2b(x(i, 1, page));
            end
        end
    end
end