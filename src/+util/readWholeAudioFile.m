function [audioData, sampleRate] = readWholeAudioFile(filename)
[audioData, sampleRate] = audioread(filename);
end

