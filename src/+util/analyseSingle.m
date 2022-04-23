
videoFReader = vision.VideoFileReader("recordings/WhiteNoise.avi", 'AudioOutputPort', true, 'AudioOutputDataType', 'double');
% 
% 
% 
% player = audioDeviceWriter('SampleRate', 48000);
% 
% [frame, audio] = videoFReader();
% 
% 
% 
% player(audio(:,1));
% 
% sample = audio(:,1);
% [~,~, max]= util.singleSidedFFT(sample, 48000,"MakePlot",true)

reader = io.ACFF16FileReader("recordings/WhiteNoise.avi");
[y, Fs] = reader.readAllAudio();
record = timetable(seconds((0:length(y)-1)'/Fs), y);



dat = []
tic 
while ~isDone(videoFReader)

    [frame, input] = videoFReader();
    dat = vertcat(dat, input(:,16));
end



% signalAnalyzer(record)

sound(dat, Fs)

[~,~, max]= util.singleSidedFFT(dat, 48000,"MakePlot",true)