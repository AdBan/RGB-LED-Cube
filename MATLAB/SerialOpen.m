function s = SerialOpen(BaudRate, DataBits, StopBits)
    % Clear previous connection
    delete(instrfind);

    % Open serial port
    s = serial('COM3', 'BaudRate', BaudRate, 'DataBits', DataBits, 'StopBits', StopBits);
    fopen(s);
    pause(1);
end