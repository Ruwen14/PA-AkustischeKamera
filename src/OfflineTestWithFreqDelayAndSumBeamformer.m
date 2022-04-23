% see https://de.mathworks.com/matlabcentral/answers/88617-overlay-an-image-in-preview-video

parameters;
% PARAMS
% -----------------------------------------------------------------
params= load('data\params.mat').params;
azAngles = -31:1:31;
ezAngles = -24:1:24;
ezAngles = flip(ezAngles);
responseMatrix = zeros(length(ezAngles), length(azAngles));
fs = params.SampleRate;
sensorArray = simulation.getSensorArrayV1();
cmap = colormap;
targetWidth = 1024;
targetHeight = 768;

delays = core.preComputeSteeringDelays(sensorArray, azAngles,ezAngles);



player = audioDeviceWriter('SampleRate',params.SampleRate);

% VIDEO
% -----------------------------------------------------------------
dummyImage = 255*ones(1200,1600,3,'double');
outstream = imshow(dummyImage);
videoFReader = vision.VideoFileReader("recordings/BrownNoise.avi", 'AudioOutputPort', true, 'AudioOutputDataType', 'double');
% -----------------------------------------------------------------


NFFT = 1600;
freqs_fft=fs*[0:NFFT/2 -NFFT/2+1:-1]/NFFT;
beamformer = core.freqdomain.FreqDelaySumBeamformer("SensorArray", sensorArray,...
    "SampleRate", fs, "AzimuthScanAngles", azAngles, "ElevationScanAngles", ezAngles, "UseParallel", true, "Frequencies", freqs_fft);


while ~isDone(videoFReader)
    
    tic

    [frame, input] = videoFReader();

    frame = imresize(frame, [targetHeight, targetWidth], "nearest");

    %     input = highpass(input, 600, params.SampleRate,'Steepness',0.85,'StopbandAttenuation',60);
    
   
  
    [responseMatrix, DOA] = beamformer.beamscan2DOptimized(input);
  
  
    
    frame = core.overlayResponse(responseMatrix, im2double(frame), cmap, false);
   

    

    if ishandle(outstream)
        frame = insertText(frame,[0 0], sprintf('%0.1f fps\n',1000/(toc*1000)),'FontSize',18,...
            'BoxOpacity',0.4,'TextColor','white');
        frame = insertText(frame,[targetWidth-220 0], sprintf('Direction: (%0.1f, %0.1f)',DOA),'FontSize',18,...
            'BoxOpacity',0.4,'TextColor','white');
        set(outstream, "CData",  frame)
    else
        break
    end
    drawnow;
    %     fprintf('%0.5f ms\n',toc*1000)
    %      axis image
end




release(videoFReader)