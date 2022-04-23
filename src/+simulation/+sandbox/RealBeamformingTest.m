clear all;
params_ = load("C:\Users\ru121koh\Desktop\PA-akustische-kamera\src\data\params.mat");
params = params_.params;




audioData = readAudioFile("0az.wav");





% 
% collector = phased.WidebandCollector('Sensor',ula,'PropagationSpeed',c, ...
%     'SampleRate',fs,'NumSubbands',1000,'ModulatedInput', false);


% 

% audioData = recordAudio(1, params);
% 
% saveAudioData("linkeeckeaz.wav", audioData)


player = audioplayer(audioData(:,1), params.SampleRate);
play(player())

% audioData = audioData(1:1000,:);




return


tic
scanAngles = -90:1:90;
maxResponses = [];
for angle = scanAngles
    maxResponses(end+1) = sum(abs(core.steeredDelayAndSumNoArray(audioData, params.MicCartCoords,[angle; 0], 48000)).^2);
end
[~, index] = max(maxResponses);
doa = [scanAngles(index); 0]


plot(scanAngles, maxResponses)
% 

% player = audioplayer(audioData(:,1), params.SampleRate);
% play(player())


% 

% 
% audioReader = getAudioReader(params);
% 
% 
% player = audioDeviceWriter('SampleRate',params.SampleRate);
% 
% 
% audioData = [];
% tic
% while toc < 1 
% [input,numOverrun] = audioReader();
% audioData = vertcat(audioData, input);
% end
% 
% audiowrite("mySpeech.wav" ,audioData, 48000)
% save("audiodata.mat", "audioData")
% 
% 
% audioFileReader = dsp.AudioFileReader('mySpeech.wav', ...
%     'SamplesPerFrame', 1000);
% 
% 
% audioFileData = [];
% for i = 1:48
% [input2,numOverrun] = audioFileReader();
% audioFileData = vertcat(audioFileData, input2);
% end



% player = audioplayer(audioData(:,1), params.SampleRate);
% player2 = audioplayer(audioFileData(:,1), params.SampleRate);
% play(player2)



% soundsc(audioData(:,1))

% 
% audioFileReader = dsp.AudioFileReader('mySpeech.wav', ...
%     'SamplesPerFrame', 1000);
% 
% audioData = [];
% tic
% while toc < 1 
% [input,numOverrun] = audioFileReader();
% audioData = vertcat(audioData, input);
% end
% 
% soundsc(audioData(:,1))
% 


% tic
% while toc < 1 
% [input,numOverrun] = audioReader();
% audioData = vertcat(audioData, input);
% end












% TotalTime = length(input)./params.SampleRate
%  Frame length (in ms) = (samples per frame / sample rate (in hz)) * 1000
% length_ms = (params.SamplesPerFrame/params.SampleRate) * 1000


% t = 0:TotalTime/(length(audioData)):TotalTime-TotalTime/length(audioData);
% plot(t, audioData)
% 
% figure
% plot(audioData)
% % Frame length (in ms) = (samples per frame / sample rate (in hz)) * 1000
% length_ms = (parameter.SamplesPerFrame/parameter.SampleRate)




function audioData = recordAudio(seconds, params)
    audioReader = getAudioReader(params);
    audioData = [];
    tic
    while toc < seconds
    [input,numOverrun] = audioReader();
    audioData = vertcat(audioData, input);
    end
end


function saveAudioData(filename, audioData)
    audiowrite(filename ,audioData, 48000)
end

function audioFileData = readAudioFile(filename)
    audioFileReader = dsp.AudioFileReader(filename, ...
        'SamplesPerFrame', 1000);

    audioFileData = [];
    for i = 1:48
    [input2,numOverrun] = audioFileReader();
    audioFileData = vertcat(audioFileData, input2);
    end
end


function deviceReader = getAudioReader(parameter) % Funktion zum EInstelllen des AudioDeviceReader-Objekt mit Standardeinstellungen. 
                                                   % Um die Rechenlast der Initialisierung in einer Audio-Stream-Schleife zu reduzieren wird Setup aufgerufen.
    
    if isLocked(audioDeviceReader) == true      % Das audioDeviceReader System Objekt liest Audiosamples über das Audioeingabegerät des Computers.
                                                % Ist das Interface in Gebrauch, wird eine logische 1 zurückgegeben.
                                                % Dabei wird eine interne Initialisierung durchgeführt.
                                                % Nach der Initialisierung können keine Änderungen mehr an dem Interface durchgeführt werden.
        release(audioDeviceReader)              % Um Änderungen am Objekt durchzuführen
    end
    
    deviceReader = audioDeviceReader('Driver','ASIO','Device',...
        'MOTU Pro Audio','NumChannels',parameter.NumberChannels,'SamplesPerFrame',...
        parameter.SamplesPerFrame,'SampleRate',parameter.SampleRate,'BitDepth',...
        '24-bit integer','ChannelMappingSource','Property','ChannelMapping',...
        parameter.ChannelMapping);              % Es werden alle spezifischen Einstellungen eingestellt
    
    setup(deviceReader)                         % Die spezifischen Einstellungen werden durchgeführt.

end
