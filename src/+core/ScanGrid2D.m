classdef ScanGrid2D < handle
    properties (Access = protected)
        AzimuthScanAngles
        ElevationScanAngles
        AngleResolution
        ScanDistance
        ScanPointsX
        ScanPointsY
        ScanPointsZ
    end

    methods

        function obj = ScanGrid2D(NameValueArgs)
            arguments
                NameValueArgs.CameraSensorWidth_mm (1,1) {mustBeScalarOrEmpty}
                NameValueArgs.CameraSensorHeight_mm (1,1) {mustBeScalarOrEmpty}
                NameValueArgs.FocalLength_mm (1,1) {mustBeScalarOrEmpty}
                NameValueArgs.ScanDistance_m (1,1) = "FarField"
                NameValueArgs.AngleResolution_dgr (1,1) {mustBeScalarOrEmpty} = 1
            end

            azimuthAngAperture= 2*atand(NameValueArgs.CameraSensorWidth_mm/(2*NameValueArgs.FocalLength_mm));
            elevationAngAperture = 2*atand(NameValueArgs.CameraSensorHeight_mm/(2*NameValueArgs.FocalLength_mm));

            obj.AzimuthScanAngles= -round(azimuthAngAperture)/2:NameValueArgs.AngleResolution_dgr:round(azimuthAngAperture)/2;
            obj.ElevationScanAngles = flip(-round(elevationAngAperture)/2:NameValueArgs.AngleResolution_dgr:round(elevationAngAperture)/2);
            obj.ScanDistance = NameValueArgs.ScanDistance_m;
            obj.AngleResolution = NameValueArgs.AngleResolution_dgr;

            if ~obj.isSetupFarField()
                obj.ScanPointsX = tand(obj.AzimuthScanAngles)*obj.ScanDistance;
                obj.ScanPointsY = tand(obj.ElevationScanAngles)*obj.ScanDistance;
                obj.ScanPointsZ = obj.ScanDistance;
            end
        end

        function TrueFalse = isSetupFarField(obj)
            if isstring(obj.ScanDistance) || obj.ScanDistance == Inf
                TrueFalse = true;
            else
                TrueFalse = false;
            end
        end

        function [X, Y, Z] = getScanPoints(obj)
            if obj.isSetupFarField
                warning("No Scan Points exist in Far-Field-Setup. Consider passing a Scalar as 'ScanDistance_m'.")
                return;
            else
                X = obj.ScanPointsX;
                Y = obj.ScanPointsY;
                Z = obj.ScanPointsZ;
            end
        end

        function az = getAzimuthScanAngles(obj)
            az = obj.AzimuthScanAngles;
        end

        function ez = getElevationScanAngles(obj)
            ez = obj.ElevationScanAngles;
        end

        function sm = getSteeringMatrix(obj, MicCoords, SampleRate)
            if obj.isSetupFarField
                sm = obj.getSteeringMatrixFarField(MicCoords, SampleRate);
            else
                sm = obj.getSteeringMatrixNearField(MicCoords, SampleRate);
            end
        end

        function plotScanGrid(obj)
            if obj.isSetupFarField
                warning("Can't plot ScanGrid in Far-Field-Setup. Consider passing a Scalar as 'ScanDistance_m'.")
                return;
            end

            [X, Y, ~] = obj.getScanPoints();
            [x,y] = meshgrid(X,Y);
            plot(x(:), y(:), 'b.')
            title("[" + length(X) + ", " + length(Y) +"] Scan Bereich bei " + obj.ScanDistance + " Metern Entfernung")
            xlabel("Horizontaler Scan in Meter")
            ylabel("Vertikaler Scan in Meter")
        end
       
    end

    methods (Access = protected)

        function sm = getSteeringMatrixNearField(obj, MicCoords, SampleRate)
            sm = zeros(length(obj.getElevationScanAngles), length(obj.getAzimuthScanAngles), length(MicCoords));

            MicX = MicCoords(2,:);
            MicY = MicCoords(3,:);
            MicZ = MicCoords(1,:);

            [scanPointsX, scanPointsY, scanPointsZ] = obj.getScanPoints();
            numAzAngles = numel(obj.getAzimuthScanAngles);
            numEzAngles = numel(obj.getElevationScanAngles);
            for azAngleIdx = 1:numAzAngles
                for ezAngleIdx = 1:numEzAngles
                    spX = scanPointsX(azAngleIdx);
                    spY = scanPointsY(ezAngleIdx);
                    spZ = scanPointsZ;

                    euclideanDistances = sqrt((spX - MicX).^2 + (spY - MicY).^2 + (spZ - MicZ).^2) ...
                        - sqrt(spX^2 + spY^2 + spZ^2);

                    travelDelays = euclideanDistances / 340;
                    sampleDelays = round(travelDelays*SampleRate);
                    sm(ezAngleIdx, azAngleIdx, 1:end) = -sampleDelays;
                end
            end
        end

        function sm = getSteeringMatrixFarField(obj, MicCoords, SampleRate)
            sm = zeros(length(obj.getElevationScanAngles), length(obj.getAzimuthScanAngles), length(MicCoords));
            azimuthAngles = obj.getAzimuthScanAngles;
            elevationAngles = obj.getElevationScanAngles;
            numAzAngles = numel(azimuthAngles);
            numEzAngles = numel(elevationAngles);
            for azAngleIdx = 1:numAzAngles
                for ezAngleIdx = 1:numEzAngles
                    steeringVect = core.timedomain.FarFieldSteeringVector(MicCoords, [azimuthAngles(azAngleIdx); elevationAngles(ezAngleIdx)]);
                    steeringVectorSamples = round(steeringVect * SampleRate);
                    sm(ezAngleIdx, azAngleIdx, 1:end) = -steeringVectorSamples;
                end
            end
        end
    end

end



