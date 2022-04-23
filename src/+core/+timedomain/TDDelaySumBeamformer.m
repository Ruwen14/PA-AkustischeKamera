classdef TDDelaySumBeamformer < handle
    %UNTITLED Summary of this class goes here
    %   Detailed explanation goes here

    properties (Access = public)
        mSensorArray
        mMicCoords
        mSampleRate
        mScanGrid2DObj
        mfastSteeringMatrix
        mIsFarField
    end

    properties(Access = public)
        SteeringMatrix
        AzimuthScanAngles
        ElevationScanAngles

    end

    methods
        function obj = TDDelaySumBeamformer(NameValueArgs)
            arguments
                NameValueArgs.SensorArray (1,1) {mustBeA(NameValueArgs.SensorArray, "phased.internal.AbstractHomogeneousArray")}
                NameValueArgs.SampleRate (1,1) {mustBeScalarOrEmpty} = 48000;
                NameValueArgs.ScanGrid2Dobj (1,1) {mustBeUnderlyingType(NameValueArgs.ScanGrid2Dobj, "core.ScanGrid2D")}
                NameValueArgs.UseParallel (1,1) {mustBeNumericOrLogical} = true
            end

            obj.mSensorArray = NameValueArgs.SensorArray;
            obj.mMicCoords = obj.mSensorArray.getElementPosition.';
            obj.mSampleRate = NameValueArgs.SampleRate;
            obj.mScanGrid2DObj = NameValueArgs.ScanGrid2Dobj;

            obj.SteeringMatrix = obj.mScanGrid2DObj.getSteeringMatrix(obj.mSensorArray.getElementPosition(), obj.mSampleRate);
            obj.AzimuthScanAngles = obj.mScanGrid2DObj.getAzimuthScanAngles();
            obj.ElevationScanAngles = obj.mScanGrid2DObj.getElevationScanAngles();
            obj.mfastSteeringMatrix = reshape(obj.SteeringMatrix, [], 16)';
            obj.mIsFarField = obj.mScanGrid2DObj.isSetupFarField();
        end

        function SpatialResponseMatrix = C_CODE_beamscan2D(obj, MicSignals)
            if obj.mIsFarField
                
                SpatialResponseMatrix = C_TDDAS_Beamscan2D_FarField_mex(MicSignals, obj.mMicCoords,obj.ElevationScanAngles, obj.AzimuthScanAngles);
            else
                SpatialResponseMatrix = C_TDDAS_Beamscan2D_NearField_mex(MicSignals, obj.ElevationScanAngles, obj.AzimuthScanAngles, obj.SteeringMatrix);
            end
        end



    end
end



