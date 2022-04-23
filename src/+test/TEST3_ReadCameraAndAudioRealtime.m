% see https://de.mathworks.com/matlabcentral/answers/88617-overlay-an-image-in-preview-video
imaqreset  

% AUDIO
% -----------------------------------------------------------------
params= load('data\params.mat').params;
if isLocked(audioDeviceReader)
    release(audioDeviceReader)
end
deviceReader = audioDeviceReader('Driver','ASIO','Device',...
    'MOTU Pro Audio','NumChannels',params.NumberChannels,'SamplesPerFrame',...
    2000,'SampleRate', params.SampleRate,'BitDepth',...
    '24-bit integer','ChannelMappingSource','Property','ChannelMapping',...
    params.ChannelMapping);              % Es werden alle spezifischen Einstellungen eingestellt

setup(deviceReader)  
player = audioDeviceWriter('SampleRate',params.SampleRate);
% -----------------------------------------------------------------


% VIDEO
% -----------------------------------------------------------------
vid = videoinput('winvideo',1);
set(vid, 'framesperTrigger', 20 ,'TriggerRepeat', Inf);
set(vid, "ReturnedColorSpace", "grayscale");
start(vid)
outstream = imshow( getsnapshot(vid)); 
% -----------------------------------------------------------------
while true
    tic
    
    frame = getdata(vid, 1);
    flushdata(vid);
    [input,numOverrun] = deviceReader();
    player(input(:, 1));



    
   if ishandle(outstream)
        frame = insertText(frame,[0 0], sprintf('%0.1f fps\n',1000/(toc*1000)),'FontSize',18,...
        'BoxOpacity',0.4,'TextColor','white');
        set(outstream, "CData", frame)
   else
       break
   end
    drawnow;
    fprintf('%0.5f ms\n',toc*1000)
%      axis image 
end




delete(vid)
clear vid
release(deviceReader)
clear deviceReader

