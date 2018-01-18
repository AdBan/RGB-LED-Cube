function PlotZ( X,Y,Z )
%PlotZ Plots data that will be transferred onto cube driver board
    RED = 1; GREEN = 2; BLUE = 3;
    size = 8;

    subplot(1,2,1)
    stem3(X,Y,Z(:,:,RED), 'ro', 'LineStyle', 'none', 'MarkerSize', 10, 'LineWidth', 2);
    hold on;
    stem3(X,Y,Z(:,:,GREEN), 'gs', 'LineStyle', 'none', 'MarkerSize', 10, 'LineWidth', 2);
    stem3(X,Y,Z(:,:,BLUE), 'bx', 'LineStyle', 'none', 'MarkerSize', 10, 'LineWidth', 2);
    hold off;
    axis([1 size 1 size 1 size]);
    title('stem3 plot')
    
    subplot(1,2,2)
    surf(X,Y,Z(:,:,RED), 'FaceColor', 'r', 'LineStyle', ':');
    hold on;
    surf(X,Y,Z(:,:,GREEN), 'FaceColor', 'g', 'LineStyle', ':');
    surf(X,Y,Z(:,:,BLUE), 'FaceColor', 'b', 'LineStyle', ':');
    hold off;
    axis([1 size 1 size 1 size]);
    title('surf plot')

    pause(.01)
end

