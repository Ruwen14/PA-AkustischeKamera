classdef SpatialResponsePlotter < handle
    %SPATIALRESPONSEPLOTTER Summary of this class goes here
    %   Detailed explanation goes here
    
    properties (Access = private)
        plhandle
        zlimits
        zMax
    end
    
    methods
        function obj = SpatialResponsePlotter(azimuthAngles, elevationAngles)
            dummyData = zeros(length(elevationAngles), length(azimuthAngles));
            obj.plhandle = surf(azimuthAngles, elevationAngles, dummyData);
            title("2-D Beamscan Spatial Signal Response")
            xlabel("Azimuth Angle [°]")
            ylabel("Elevation Angle [°]")
            obj.zMax = 0;            
        end
        
        function handle = getHandle(obj)
            handle = obj.plhandle;
        end

        function updatePlot(obj, data)
            dmax = max(data(:));
            if dmax > obj.zMax
                obj.zMax = dmax + 5;
                set(obj.plhandle.Parent, "ZLim", [0 obj.zMax])
            end
            set(obj.plhandle, "ZData", data);
        end


    end
end

