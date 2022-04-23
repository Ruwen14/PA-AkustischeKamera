function vidDev = getVideoDeviceReader()
    imaqreset
    
    vidDev = videoinput('winvideo',1, 'RGB8_1600x1200');
    set(vidDev, 'framesperTrigger', 1 ,'TriggerRepeat', Inf);
    set(vidDev, "ReturnedColorSpace", "grayscale");
    start(vidDev)
end