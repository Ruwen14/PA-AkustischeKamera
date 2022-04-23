


azAngles = -90:90;
ezAngles = -45:45;

repMat = load('data\ResponseMatrix.mat').responseMatrix;
SpatialRespPlotter = util.SpatialResponsePlotter(azAngles, ezAngles);
handle = SpatialRespPlotter.getHandle();

while true
    
    xmin=0.8;
    xmax=1;
    n=1;
    x=xmin+rand(1,n)*(xmax-xmin);   
    tic

    if ishandle(handle)
        SpatialRespPlotter.updatePlot(repMat/x);
        drawnow limitrate;
    else
        break
    end
    toc * 1000;
end



