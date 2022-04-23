classdef ACFF16FileReader < handle
    %ACFF16FILEWRITER Summary of this class goes here
    %   Detailed explanation goes here
    
    properties (Access = private)
        m_reader
        m_filename
    end
    
    methods
        function obj = ACFF16FileReader(filename)
            obj.m_filename = filename;
            obj.m_reader = vision.VideoFileReader(filename, 'AudioOutputPort', true, 'AudioOutputDataType', 'double');
        end
        
 
        function fname = getReaderObject(obj)
            fname = obj.m_reader;
        end

        function spp = getInfoAudioSamplesPerFrame(obj)
            spp = round(obj.m_reader.info.AudioSampleRate / ...
                obj.m_reader.info.VideoFrameRate);
        end

        function fs = getInfoAudioSampleRate(obj)
            fs = obj.m_reader.info.AudioSampleRate;
        end

        function fr = getInfoVideoFrameRate(obj)
            fr = obj.m_reader.info.VideoFrameRate;
        end

        function [videoFrame, audioFrame] = readDataFrame(obj)
            [videoFrame, audioFrame] = obj.m_reader();
        end

        function [allChannelsAudioData, sampleRate] = readAllAudio(obj)
            [allChannelsAudioData, sampleRate] = audioread(obj.m_filename);
        end

        function playSoundOfChannel(obj, channel)
            [y, Fs] = obj.readAllAudio();
            sound(y(:, channel), Fs);
        end

        function openInSignalAnalyzer(obj)
            [y, Fs] = obj.readAllAudio();
            ACFF16AudioDataRecord = timetable(seconds((0:length(y)-1)'/Fs), y);
            signalAnalyzer(ACFF16AudioDataRecord);

        end


        function close(obj)
            release(obj.m_reader)
        end
    end
end








