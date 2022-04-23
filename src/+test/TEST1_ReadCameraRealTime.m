% see https://de.mathworks.com/matlabcentral/answers/88617-overlay-an-image-in-preview-video
imaqreset     
vid = videoinput('winvideo',1);
set(vid, 'framesperTrigger', 20 ,'TriggerRepeat', Inf);
set(vid, "ReturnedColorSpace", "grayscale");
start(vid)
outstream = imshow(getsnapshot(vid)); 
exampleData = load("data/ResponseMatrix.mat").responseMatrix;
cmap = colormap;
set(outstream)
% -----------------------------------------------------------------
while true
    tic
    frame = getdata(vid, 1);
    flushdata(vid);
    
   
    frame = im2double(frame);
    tic 
    frame = core.overlayResponse(exampleData, frame, cmap, true);
    fprintf('%0.5f ms\n',toc*1000)

    
   if ishandle(outstream)
        set(outstream, "CData", frame)
   else
       break
   end
    drawnow;
%     fprintf('%0.5f ms\n',toc*1000)
end




delete(vid)
clear vid

