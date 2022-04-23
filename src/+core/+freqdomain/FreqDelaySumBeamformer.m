classdef FreqDelaySumBeamformer < handle
    %FREQDELAYSUMBEAMFORMER Summary of this class goes here
    %   Detailed explanation goes here

    properties (Access = public)
        mSensorArray
        mSampleRate
        mAzimuthScanAngles
        mElevationScanAngles
        mSteeringDelays
        mUseParallel
        mScanPatternSize
        mPatternFlatten
        mScanAngles
        mFrequencies
        mSteeringMatrix
    end

    methods
        function obj = FreqDelaySumBeamformer(NameValueArgs)
            arguments
                NameValueArgs.SensorArray
                NameValueArgs.SampleRate (1,1) {mustBeScalarOrEmpty} = 48000;
                NameValueArgs.AzimuthScanAngles (1, :)  {mustBeNumeric} = []
                NameValueArgs.ElevationScanAngles (1, :) {mustBeNumeric} = []
                NameValueArgs.Frequencies = []
                NameValueArgs.UseParallel (1,1) {mustBeNumericOrLogical} = false
            end

            obj.mSensorArray = NameValueArgs.SensorArray;
            obj.mSampleRate = NameValueArgs.SampleRate;
            obj.mAzimuthScanAngles = NameValueArgs.AzimuthScanAngles;
            obj.mElevationScanAngles = NameValueArgs.ElevationScanAngles;
            obj.mFrequencies = NameValueArgs.Frequencies;
            obj.mUseParallel = NameValueArgs.UseParallel;

            if (~isempty(obj.mAzimuthScanAngles) && ~isempty(obj.mElevationScanAngles))
                obj.mSteeringDelays = core.preComputeSteeringDelays(obj.mSensorArray, obj.mAzimuthScanAngles, obj.mElevationScanAngles);
                obj.mScanPatternSize = [numel(obj.mElevationScanAngles), numel(obj.mAzimuthScanAngles)];
                [ScanAz, ScanEl] = meshgrid(obj.mAzimuthScanAngles, obj.mElevationScanAngles);
                obj.mScanAngles = [ScanAz(:) ScanEl(:)].';
                obj.mPatternFlatten = zeros(prod(obj.mScanPatternSize),1);
                obj.mSteeringMatrix = core.freqdomain.preComputePhaseSteeringMatrix(obj.mSensorArray, obj.mAzimuthScanAngles, obj.mElevationScanAngles, obj.mFrequencies);
            end

            if obj.mUseParallel
                if isempty(gcp("nocreate"))
                    parpool("threads");
                end
            end


        end

        function [spatialPowerMatrix, DOA] = beamscan2D(obj, micDataMatrix)
            NFFT = size(micDataMatrix, 1);
            data_fft = fft(micDataMatrix, NFFT);

            azAngles = obj.mAzimuthScanAngles;
            ezAngles = obj.mElevationScanAngles;

            %             freqs_fft = fftshift(linspace(-obj.mSampleRate/2, obj.mSampleRate/2 - (obj.mSampleRate/NFFT), NFFT));
            freqs_fft=obj.mSampleRate*[0:NFFT/2 -NFFT/2+1:-1]/NFFT;
            spatialPowerMatrix = zeros(length(ezAngles), length(azAngles));

            numAzAngles = numel(azAngles);
            numEzAngles = numel(ezAngles);
            delays = obj.mSteeringDelays;
            for azAngleIdx = 1:numAzAngles
                for ezAngleIdx = 1:numEzAngles
                    delayVec = squeeze(delays(ezAngleIdx, azAngleIdx,:));
                    phaseShift = exp(-1i*2*pi*delayVec*freqs_fft)';
                    spatialPowerMatrix(ezAngleIdx, azAngleIdx) = sum(abs(sum(data_fft.*phaseShift, 2)).^2);
                end
            end
            [~, max_idx]=max(spatialPowerMatrix(:));
            [maxRow,maxCol]=ind2sub(size(spatialPowerMatrix),max_idx);
            DOA = [azAngles(maxCol), ezAngles(maxRow)];

        end

        function [spatialPowerMatrix, DOA] = beamscan2DOptimized(obj, micDataMatrix)

            NFFT = size(micDataMatrix, 1);
            data_fft = fft(micDataMatrix, NFFT);

            azAngles = obj.mAzimuthScanAngles;
            ezAngles = obj.mElevationScanAngles;

            spatialPowerMatrix = zeros(length(ezAngles), length(azAngles));

            numAzAngles = numel(azAngles);
            numEzAngles = numel(ezAngles);
            SteeringMatrix = obj.mSteeringMatrix;
            
            parfor azAngleIdx = 1:numAzAngles
                for ezAngleIdx = 1:numEzAngles
                    spatialPowerMatrix(ezAngleIdx, azAngleIdx) = sum(abs(sum(data_fft.*SteeringMatrix{ezAngleIdx, azAngleIdx}, 2)).^2);
                end
            end
            [~, max_idx]=max(spatialPowerMatrix(:));
            [maxRow,maxCol]=ind2sub(size(spatialPowerMatrix),max_idx);
            DOA = [azAngles(maxCol), ezAngles(maxRow)];
            
        end


        function [spatialPowerMatrix, DOA] = beamscan2DCompact(obj, micDataMatrix)

            NFFT = size(micDataMatrix, 1);
            data_fft = fft(micDataMatrix, NFFT);

            azAngles = obj.mAzimuthScanAngles;
            ezAngles = obj.mElevationScanAngles;

            spatialPowerMatrix = zeros(length(ezAngles), length(azAngles));
            SteeringMatrix = obj.mSteeringMatrix;
            for iter = 0:numel(ezAngles)-1
                azimuthSteeringVectors = [SteeringMatrix(iter+1, :)];
                azimuthSteeringVectors = reshape([azimuthSteeringVectors{:}], [], 16, numel(azAngles));
                spatialPowerMatrix(iter+1, :) = sum(abs(sum(data_fft.*azimuthSteeringVectors, 2)).^2);
            end
            [~, max_idx]=max(spatialPowerMatrix(:));
            [maxRow,maxCol]=ind2sub(size(spatialPowerMatrix),max_idx);
            DOA = [azAngles(maxCol), ezAngles(maxRow)];

        end
        
        
        function [spatialPowerMatrix, DOA] = testCVariant(obj, micDataMatrix)
            
            
            NFFT = size(micDataMatrix, 1);
            data_fft = fft(micDataMatrix, NFFT);

            azAngles = obj.mAzimuthScanAngles;
            ezAngles = obj.mElevationScanAngles;

            spatialPowerMatrix = zeros(length(ezAngles), length(azAngles));
            SteeringMatrix = obj.mSteeringMatrix;
            for iter = 0:numel(ezAngles)-1
                azimuthSteeringVectors = [SteeringMatrix(iter+1, :)];
                azimuthSteeringVectors = reshape([azimuthSteeringVectors{:}], [], 16, numel(azAngles));
                spatialPowerMatrix(iter+1, :) = sum(abs(sum(data_fft.*azimuthSteeringVectors, 2)).^2);
            end
            [~, max_idx]=max(spatialPowerMatrix(:));
            [maxRow,maxCol]=ind2sub(size(spatialPowerMatrix),max_idx);
            DOA = [azAngles(maxCol), ezAngles(maxRow)];

        end






    end
end

