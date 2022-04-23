vid = videoinput('winvideo',1);
triggerconfig(vid, 'Immediate');
set(vid,'FramesPerTrigger',inf);
vid.TriggerRepeat = inf;

azAngles = -90:90;
ezAngles = -45:1:45;
dummyData = zeros(length(ezAngles), length(azAngles));


figure
plotter = util.SpatialResponsePlotter(azAngles, ezAngles)
figure
handle = imshow(ones(600,800,3));
setappdata(handle,'UpdatePreviewWindowFcn',@frameAquisitionCallback);
set(handle, "UserData", plotter)



preview(vid, handle)

function frameAquisitionCallback(obj,event,himage)
himage.CData = event.Data;
azAngles = -90:90;
ezAngles = -45:1:45;
dummyData = zeros(length(ezAngles), length(azAngles));
c = himage.UserData.updatePlot(dummyData);;




end



