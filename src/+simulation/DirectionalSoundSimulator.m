classdef DirectionalSoundSimulator < handle
    %DIRECTIONALSOUNDSIMULATOR Summary of this class goes here
    %   Detailed explanation goes here
    properties (Access = private)
        mSensorArray
        mSamplingRate
        mFileReader
        mCollector
        mSamplesPerFrame
    end
    
    methods
        function obj = DirectionalSoundSimulator(options)
            arguments
                options.SensorArray (1,1)
                options.SamplingRate (1,1) {mustBeNumeric}
                options.AudioFile {mustBeText}
                options.SamplesPerFrame (1,1) {mustBeNumeric} = 1000;
            end

            obj.mSensorArray = options.SensorArray;
            obj.mSamplingRate = options.SamplingRate;
            obj.mFileReader =  dsp.AudioFileReader(options.AudioFile, 'SamplesPerFrame', options.SamplesPerFrame);
            obj.mSamplesPerFrame = options.SamplesPerFrame;
            obj.mCollector = phased.WidebandCollector("Sensor", obj.mSensorArray, "PropagationSpeed", 340, ...
                "SampleRate", obj.mSamplingRate, "NumSubbands", 1000, "ModulatedInput", false);
        end

        function aFrame = simulateDirectionalFrame(obj, angle)
            frame = obj.mFileReader();
            aFrame = obj.mCollector(frame, angle);
        end

        function aRecord = simulateDirectionalRecord(obj, duration, angle)
            t = 0:1/obj.mSamplingRate:duration-1/obj.mSamplingRate;
            NTSample = duration * obj.mSamplingRate;
            aRecord = zeros(NTSample,obj.mSensorArray.getNumElements());

            for m = 1:obj.mSamplesPerFrame:NTSample
                sig_idx = m:m+obj.mSamplesPerFrame-1;
                frame = obj.mFileReader();
                aFrame = obj.mCollector(frame, angle);
                aRecord(sig_idx,:) = aFrame;
            end
        end
        
        function outputArg = method1(obj,inputArg)
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
            outputArg = obj.Property1 + inputArg;
        end
    end
end

