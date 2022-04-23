

parameters;

if exist('audioReader', 'var')
    if isLocked(audioReader)
        release(audioReader)
    end
end


params= load('data\params.mat').params;

audioReader = io.getAudioDeviceReader(params);



audioData = [];
tic

disp("Start Recording")
while toc < 3
    [input, numOverrun] = audioReader();
    audioData = vertcat(audioData, input);
end
disp("Stop Recording")

io.playAudioData(audioData(:,3), params.SampleRate);
io.writeAudioDataToFile("test.wav", audioData, params.SampleRate);



[audioData, sampleRate] = io.readWholeAudioFile("test.wav");
io.playAudioData(audioData(:,1), sampleRate);









% function audioData = recordAudio(seconds, params)
%     audioReader = getAudioReader(params);
%     audioData = [];
%     tic
%     while toc < seconds
%     [input,numOverrun] = audioReader();
%     audioData = vertcat(audioData, input);
%     end
% end