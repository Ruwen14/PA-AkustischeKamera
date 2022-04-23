

sensorArray = simulation.getSensorArrayV1();
fs = 48000;
c = 340;
DSSimulator = simulation.DirectionalSoundSimulator( ...
    "SensorArray", sensorArray,"SamplingRate", fs, ...
    "AudioFile", 'SpeechDFT-16-8-mono-5secs.wav', ...
    "SamplesPerFrame", 1000);
   




ang_dft = [0;0];
frame = DSSimulator.simulateDirectionalFrame(ang_dft);



% frame = DSSimulator.simulateDirectionalRecord(3, ang_dft);




% sigArray = DSSimulator.simulateDirectionalFrame(ang_dft);

cmap = colormap;
realimg = imread("C:\Users\ruwen\Pictures\pepe.png");
realimg = imresize(realimg, [600, 800]);
realimg = im2double(realimg);



azAngles = -31:2:31;
ezAngles = -24:2:24;

delays = core.preComputeSteeringDelays(sensorArray, azAngles,ezAngles);




responseMatrix = zeros(length(ezAngles), length(azAngles));
tic

numAzAngles = numel(azAngles);
numEzAngles = numel(ezAngles);

parfor azAngleIdx = 1:numAzAngles
    for ezAngleIdx = 1:numEzAngles
        tic
           
         delayVec = squeeze(delays(ezAngleIdx, azAngleIdx,:));
          responseMatrix(ezAngleIdx, azAngleIdx) = sum(abs(core.steeredDelayAndSumOptimized(frame, fs, delayVec)).^2);
        
%           responseMatrix(ezAngleIdx, azAngleIdx) = sum(abs(core.steeredDelayAndSum(frame, sensorArray, [azAngles(azAngleIdx); ezAngles(ezAngleIdx)], fs)).^2); 
    end
end

[max_num, max_idx]=max(responseMatrix(:));
[maxRow,maxCol]=ind2sub(size(responseMatrix),max_idx);
DOA = [azAngles(maxCol), ezAngles(maxRow)]
toc*1000;


rgbResponse = imresize(core.mapMat2Img(responseMatrix, cmap), [1200 1600]);

img = core.overlayResponse(responseMatrix, realimg, cmap, false);

% 
% img = core.overlayResponse(responseMatrix, realimg, cmap, false);
% 
% DOA

imshow(rgbResponse)









