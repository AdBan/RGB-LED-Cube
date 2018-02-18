function PolandBudget(serial, figure, plotOn)

    Zach = 430.95;
    Pomo = 348.06;
    WarM = 658.01;
    Podl = 781.93;
    Lubu = 482.00;
    Wiel = 299.42;
    KujP = 459.22;
    Mazo = 485.58;
    Doln = 447.81;
    Lodz = 300.11;
    Swie = 547.41;
    Lube = 625.47;
    Opol = 391.95;
    Slas = 391.38;
    Malo = 328.66;
    Podk = 623.55;

    [X,Y] = meshgrid(1:4, 1:4);
    Wojewodztwa = rot90([ Zach Pomo WarM Podl;
                    Lubu Wiel KujP Mazo;
                    Doln Lodz Swie Lube;
                    Opol Slas Malo Podk ],2);
    Srednia = mean(mean(Wojewodztwa));

% map values
    WojewodztwaMax = max(max(Wojewodztwa)); WojewodztwaMin = min(min(Wojewodztwa));
    RED = 1; BLUE = 3; GREEN = 2;
    Zout = zeros(4,4,3);
    Zcube = zeros(8,8,3);
    SredniaMap = round(MapValue(Srednia, WojewodztwaMin, WojewodztwaMax, 1, 8));
    
    for i = 1 : size(Wojewodztwa,1)
        for j = 1 : size(Wojewodztwa,2)
            val = round(MapValue(Wojewodztwa(i,j), WojewodztwaMin, WojewodztwaMax, 1, 8));
            if (val > 4)
                Zout(i, j, RED) = val;
            else
                Zout(i, j, BLUE) = val;
            end
        end
    end
    
    Zcube(3:6,3:6,:) = Zout;
    Zcube(1:2,1:8,:) = SredniaMap;
    Zcube(7:8,1:8,:) = SredniaMap;
    Zcube(1:8,1:2,:) = SredniaMap;
    Zcube(1:8,7:8,:) = SredniaMap;
  
    DiscreteCubeRGB = Z_To_DiscreteCubeRGB(Zcube);   
    %hardcode other values in DiscreteCubeRGB
    DiscreteCubeRGB(3:4,3,1:5,RED) = 1;
    DiscreteCubeRGB(6,4,1:5,RED) = 1;
    DiscreteCubeRGB(4,4,1:4,RED) = 1;
    DiscreteCubeRGB(6,3,1:8,RED) = 1;
    DiscreteCubeRGB(5,3,1:4,BLUE) = 1;
    DiscreteCubeRGB(3,5:6,1:2,BLUE) = 1;
    DiscreteCubeRGB(6,5,1:2,BLUE) = 1;
    DiscreteCubeRGB(4,6,1:3,BLUE) = 1;
    DiscreteCubeRGB(6,6,1:3,BLUE) = 1;
    DiscreteCubeRGB(5,6,1:3,BLUE) = 1;
    DiscreteCubeRGB(5,4,1:3,BLUE) = 1;
    
    CubeData = DiscreteCubeRGB_To_CubeData(DiscreteCubeRGB);

    %if plot is enabled, plot data
    if (plotOn)
       % PlotCubeData(CubeData, figure);
        cla; clf;
        hold on;
        mesh(X,Y,Srednia * ones(4));       
        stem3(X,Y,Wojewodztwa');
        view([-37.5 30]);
        axis('square')
    end
    SendCubeData(serial, CubeData);
    pause(5);
    cla;
end

