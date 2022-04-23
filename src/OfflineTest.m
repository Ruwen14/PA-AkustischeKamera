% see https://de.mathworks.com/matlabcentral/answers/88617-overlay-an-image-in-preview-video

parameters;
% PARAMS
% -----------------------------------------------------------------
params= load('data\params.mat').params;
azAngles = -31:1:10;
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


while ~isDone(videoFReader)
    tic


    [frame, input] = videoFReader();

    frame = imresize(frame, [targetHeight, targetWidth], "nearest");

%     input = highpass(input, 600, params.SampleRate,'Steepness',0.85,'StopbandAttenuation',60);

%         input = bandpass(input,[950 1050],params.SampleRate,'Steepness',0.85,'StopbandAttenuation',90);
%     player(input(:, 14));

    [loudness,~] = acousticLoudness(input(:,10), fs);


    %Beamforming
%     % -----------------------------------------------------------------
%     tic
%     responseMatrix = TD_DAS_BEAMFORM_CCODE_mex(input, sensorArray.getElementPosition, ezAngles, azAngles);
%     toc*1000

    tic
    numAzAngles = numel(azAngles);
    numEzAngles = numel(ezAngles);
    parfor azAngleIdx = 1:numAzAngles
        for ezAngleIdx = 1:numEzAngles
            delayVec = squeeze(delays(ezAngleIdx, azAngleIdx,:));
            responseMatrix(ezAngleIdx, azAngleIdx) = sum(abs(core.steeredDelayAndSumOptimized(input, fs, delayVec)).^2);
        end
    end
  toc*1000

    [max_num, max_idx]=max(responseMatrix(:));
    [maxRow,maxCol]=ind2sub(size(responseMatrix),max_idx);
    DOA = [azAngles(maxCol), ezAngles(maxRow)];


%     if loudness > 3.5
        frame = core.overlayResponse(responseMatrix, im2double(frame), cmap, false);
%     end

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



release(videoFReader)