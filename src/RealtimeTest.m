% see https://de.mathworks.com/matlabcentral/answers/88617-overlay-an-image-in-preview-video

parameters;
% PARAMS
% -----------------------------------------------------------------
params= load('data\params.mat').params;
azAngles = -31:2:31;
ezAngles = -24:2:24;
ezAngles = flip(ezAngles);
responseMatrix = zeros(length(ezAngles), length(azAngles));
fs = params.SampleRate;
sensorArray = simulation.getSensorArrayV1();
cmap = colormap;
targetWidth = 1024;
targetHeight = 768;


delays = core.preComputeSteeringDelays(sensorArray, azAngles,ezAngles);


% -----------------------------------------------------------------

% AUDIO
% -----------------------------------------------------------------
% ar = simulation.getSensorArrayV1();
% simulation.viewSensorArray3D(ar);
% return
audioDevice = getAudioDeviceReader(params);
player = audioDeviceWriter('SampleRate',params.SampleRate);
% -----------------------------------------------------------------



% VIDEO
% -----------------------------------------------------------------
videoDevice = getVideoDeviceReader();
outstream = imshow( getsnapshot(videoDevice)); 
% -----------------------------------------------------------------



scope = dsp.SpectrumAnalyzer;
scope.SampleRate = params.SampleRate;
scope.SpectralAverages = 1;
scope.PlotAsTwoSidedSpectrum = false;
scope.RBWSource = 'Auto';
scope.PowerUnits = 'dBW';






while true
    tic
    
    frame = getdata(videoDevice, 1);
    frame = imresize(frame, [targetHeight, targetWidth], "nearest");
    flushdata(videoDevice);

    [input,numOverrun] = audioDevice();

%     input = highpass(input, 900, params.SampleRate,'Steepness',0.85,'StopbandAttenuation',60);
% % %     player(input(:, 14));
    input = bandpass(input,[950 1050],params.SampleRate,'Steepness',0.85,'StopbandAttenuation',90);

    [loudness,~] = acousticLoudness(input(:,10), fs);
    
    scope(input(:,1))

    %Beamforming
    % -----------------------------------------------------------------
    
    numAzAngles = numel(azAngles);
    numEzAngles = numel(ezAngles);
    parfor azAngleIdx = 1:numAzAngles
        for ezAngleIdx = 1:numEzAngles                   
            delayVec = squeeze(delays(ezAngleIdx, azAngleIdx,:));
            responseMatrix(ezAngleIdx, azAngleIdx) = sum(abs(core.steeredDelayAndSumOptimized(input, fs, delayVec)).^2);
%               
%          
%             responseMatrix(ezAngleIdx, azAngleIdx) = sum(abs(core.steeredDelayAndSum(input, sensorArray, [azAngles(azAngleIdx); ezAngles(ezAngleIdx)], fs)).^2);
        end
    end
    
    [max_num, max_idx]=max(responseMatrix(:));
    [maxRow,maxCol]=ind2sub(size(responseMatrix),max_idx);
    DOA = [azAngles(maxCol), ezAngles(maxRow)];
    

%     if loudness > 5
    
    frame = core.overlayResponse(responseMatrix, im2double(frame), cmap, false);
    

%     rgbResponse = core.mapMat2Img(responseMatrix, cmap);
%     [height, width, ~] = size(frame);
%     frame = imresize(rgbResponse, [height, width]);
 
%     end

    % -----------------------------------------------------------------

    
   
   if ishandle(outstream)
        frame = insertText(frame,[0 0], sprintf('%0.1f fps\n',1000/(toc*1000)),'FontSize',18,...
        'BoxOpacity',0.4,'TextColor','white');
        frame = insertText(frame,[targetWidth-220 0], sprintf('Direction: (%0.1f, %0.1f)',DOA),'FontSize',18,...
        'BoxOpacity',0.4,'TextColor','white');
        set(outstream, "CData", frame)
   else
       break
   end
    drawnow;
%     fprintf('%0.5f ms\n',toc*1000)
%      axis image 
end




delete(videoDevice)
clear videoDevice
release(audioDevice)
clear audioDevice

function audDev = getAudioDeviceReader(params)
    if isLocked(audioDeviceReader)
        release(audioDeviceReader)
    end

    audDev = audioDeviceReader('Driver','ASIO','Device',...
    'MOTU Pro Audio','NumChannels',params.NumberChannels,'SamplesPerFrame',...
    params.SamplesPerFrame,'SampleRate', params.SampleRate,'BitDepth',...
    '24-bit integer','ChannelMappingSource','Property','ChannelMapping',...
    params.ChannelMapping);              % Es werden alle spezifischen Einstellungen eingestellt

    setup(audDev)  
end


function vidDev = getVideoDeviceReader()
    imaqreset
    
    vidDev = videoinput('winvideo',1, 'RGB8_1600x1200');
    set(vidDev, 'framesperTrigger', 1 ,'TriggerRepeat', Inf);
    set(vidDev, "ReturnedColorSpace", "grayscale");
    start(vidDev)
end
