%% Define a Uniform Linear Array
% First, define a uniform linear array (ULA) to receive the signal. The
% array contains 10 omnidirectional elements (microphones) spaced 5 cm
% apart. Set the upper bound for frequency range of interest to 4 kHz
% because the signals used in this example are sampled at 8 kHz.

clc;

microphone = ...
    phased.OmnidirectionalMicrophoneElement('FrequencyRange',[20 4000]);

Nele = 10;
ula = phased.ULA(Nele,0.05,'Element',microphone);
c = 340;  % speed of sound, in m/s

ang_dft = [-35; 0];
ang_cleanspeech = [-10; 10];
ang_laughter = [20; 0];
fs = 8000;
carrierFreq = 100e6;
collector = phased.WidebandCollector('Sensor',ula,'PropagationSpeed',c, ...
    'SampleRate',fs,'NumSubbands',1000,'ModulatedInput', false);

t_duration = 3;  % 3 seconds
t = 0:1/fs:t_duration-1/fs;
prevS = rng(2008);
noisePwr = 1e-4; 

NSampPerFrame = 1000;
NTSample = t_duration*fs;
sigArray = zeros(NTSample,Nele);
voice_dft = zeros(NTSample,1);
voice_cleanspeech = zeros(NTSample,1);
voice_laugh = zeros(NTSample,1);

% set up audio device writer
player = audioDeviceWriter('SampleRate',fs);

dftFileReader = dsp.AudioFileReader('SpeechDFT-16-8-mono-5secs.wav', ...
    'SamplesPerFrame',NSampPerFrame);
speechFileReader = dsp.AudioFileReader('FemaleSpeech-16-8-mono-3secs.wav', ...
    'SamplesPerFrame',NSampPerFrame);
laughterFileReader = dsp.AudioFileReader('Laughter-16-8-mono-4secs.wav', ...
    'SamplesPerFrame',NSampPerFrame);


%simulate
for m = 1:NSampPerFrame:NTSample
    sig_idx = m:m+NSampPerFrame-1;
    x1 = dftFileReader();
    x2 = speechFileReader();
    x3 = 2*laughterFileReader();
    temp = collector(x1 , ...
        ang_dft );
%     player(0.5*temp(:,3));

    
    sigArray(sig_idx,:) = temp;
    voice_dft(sig_idx) = x1;
    voice_cleanspeech(sig_idx) = x2;
    voice_laugh(sig_idx) = x3;
end

plot(t, sigArray(:,1), "g", t, sigArray(:,10), "b")
legend("mic1", "mic10");
title("Time-Delay Mic1 and Mic10")




angSteer = [-30;0];
beamformer = sandbox.TimeDelayBeamformer2('SensorArray',ula, ...
    'SampleRate',fs,'PropagationSpeed',c, "WeightsOutputPort", true,"DirectionSource", "Input port");
[S,w] = beamformer(sigArray, angSteer); % Shiftet and Summer Signal
agCbf = pow2db(mean((voice_dft).^2)/...
    mean((S - voice_dft).^2));

angles = -90:1:90;
Y = [];
tic
for azang = angles
    Y(end+1) = max(beamformer(sigArray, [azang; 0]));
end
toc
[~, index] = max(Y);
angles(index)







y2 = core.steeredDelayAndSum(sigArray, ula, [-30;0], fs, w);
y3 = core.steeredDelayAndSumLoop(sigArray, ula, [-30;0], fs, w);



scanAngles = -90:10:90;
tic
sourceAngle = core.delayAndSumBeamscanHorizontal(sigArray, ula, scanAngles, fs, w)

toc








