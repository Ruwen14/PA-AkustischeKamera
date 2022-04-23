%%Time specifications:
Fs = 8000;                   % samples per second
dt = 1/Fs;                   % seconds per sample
StopTime = 0.25;             % seconds
t = (0:dt:StopTime-dt)';     % seconds
%%Sine wave:
Fc = 80;                     % hertz
x =  cos(2*pi*Fc*t) +200;


S = 0.7*sin(2*pi*50*t) + sin(2*pi*120*t);


Fs = 1000;            % Sampling frequency                    
T = 1/Fs;             % Sampling period       
L = 1500;             % Length of signal
t = (0:L-1)*T;   

S = 0.7*sin(2*pi*50*t) + sin(2*pi*120*t);
X = S + 2*randn(size(t));


% [s,f,t] = spectrogram(X, 300,19,20, Fs, 'yaxis')
[freqs, cAmpl, maxFreq ] = util.singleSidedFFT(X, 1000,"MakePlot",true)


