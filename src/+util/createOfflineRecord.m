parameters;
params= load('data\params.mat').params;


videoFWriter = vision.VideoFileWriter('1khzFarAway.avi', 'AudioInputPort', true);



params.SamplesPerFrame = io.syncFpsAndSampleRate(videoFWriter.FrameRate, params.SampleRate);
audioReader = io.getAudioDeviceReader(params);
videoDevice = io.getVideoDeviceReader();

tic
disp("Start Recording")
while toc < 7
    frame = getdata(videoDevice, 1);
    flushdata(videoDevice)

    [input, numOverrun] = audioReader();


%     input = highpass(input, 300, params.SampleRate,'Steepness',0.85,'StopbandAttenuation',60);

    step(videoFWriter, frame, input)

  
end
release(videoFWriter)
release(audioReader)
disp("Stop Recording")







