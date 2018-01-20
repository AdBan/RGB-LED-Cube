function d = b2d(x)
% Convert a binary array to a decimal number. Works for matrixes up to 3
% dimensions

    inputRows = size(x,1);  % in case input is 2 dim. matrix eg. zeros(2,2)
    inputPages = size(x,3); % in case input is multipage eg. zeros(2,2,2)

    for page = 1 : inputPages
        if (inputRows < 2)
            %array [ bin bin bin ]
            z = 2.^(length(x)-1:-1:0);
            d(1, 1) = sum(x.*z);
        else
            %array [ bin bin bin;
            %        bin bin bin ]
            for i = 1 : inputRows
                d(i + 8*(page - 1), 1) = b2d(x(i, :, page));
            end
        end
    end
end