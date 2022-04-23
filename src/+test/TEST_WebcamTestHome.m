% see https://de.mathworks.com/matlabcentral/answers/88617-overlay-an-image-in-preview-video
imaqreset     


azAngles = -90:90;
ezAngles = -45:1:45;

cmap = colormap;
dummyData = zeros(length(ezAngles), length(azAngles));
repMat = load('data\ResponseMatrix.mat').responseMatrix;
vid = videoinput('winvideo',1, "MJPG_1280x800");
set(vid, 'framesperTrigger', 20 ,'TriggerRepeat', Inf);



nexttile
outstream = imshow(getsnapshot(vid)); 
nexttile
SpatialRespPlotter = util.SpatialResponsePlotter(azAngles, ezAngles);







start(vid)
% -----------------------------------------------------------------
while true
    tic
    frame = getdata(vid, 1);
    if vid.FramesAvailable > 20
        flushdata(vid)
    end
    
     xmin=0.8;
    xmax=1;
    n=1;
    x=xmin+rand(1,n)*(xmax-xmin);  
    

  
    frame = core.overlayResponse(repMat/x, im2double(frame), cmap, false);

   if ishandle(outstream)
        SpatialRespPlotter.updatePlot(repMat/x)
        set(outstream, "CData", frame)
   else
       break
   end
    drawnow limitrate;
    fprintf('%0.5f ms\n',toc*1000)
end




delete(vid)
clear vid

