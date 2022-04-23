classdef ACFF16FileWriter < handle
    %ACFF16FILEWRITER Summary of this class goes here
    %   Detailed explanation goes here
    
    properties (Access = private)
        m_writer
        m_filename
    end
   
    methods
        function obj = ACFF16FileWriter(filename, framesPerSecond)
            splitted = filename.split(".");
            obj.m_filename = splitted(1) + "-ACFF16.avi";
            obj.m_writer = vision.VideoFileWriter(obj.m_filename, 'AudioInputPort', true, 'FrameRate', framesPerSecond);
            %ACFF16FILEWRITER Construct an instance of this class
            %   Detailed explanation goes here
        end
        
        function fname = getFilename(obj)
            fname = obj.m_filename;
        end

        function fname = getWriterObject(obj)
            fname = obj.m_writer;
        end

        function writeDataFrame(obj, videoFrame, audioFrame)
            step(obj.m_writer, videoFrame, audioFrame)
        end
    
        function close(obj)
            release(obj.m_writer)
        end
    end
end








