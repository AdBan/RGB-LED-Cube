function F = CreateFigure( figNumber, figTitle)
%UNTITLED Creates figure F(figNumber) with figTitle

    F = figure(figNumber);
    title(figTitle);
    axis([1 8 1 8 1 8]);
    view([-37.5 30]);
    pbaspect([1 1 1]);
    hold on;

end

