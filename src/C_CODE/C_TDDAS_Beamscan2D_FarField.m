function SpatialResponseMatrix = C_TDDAS_Beamscan2D_FarField(MicSignals, GridPos, ezAngles, azAngles) %#codegen
    SpatialResponseMatrix = zeros(length(ezAngles), length(azAngles));
    numAzAngles = numel(azAngles);
    numEzAngles = numel(ezAngles);
    parfor azAngleIdx = 1:numAzAngles
        for ezAngleIdx = 1:numEzAngles
            azang = azAngles(azAngleIdx);
            elang = ezAngles(ezAngleIdx);
            incidentdir = [-cosd(elang).*cosd(azang);...
                -cosd(elang).*sind(azang);...
                -sind(elang)];

            tau = round(-(GridPos*incidentdir/340)*48000);
            Mat = MicSignals;
            for i = 1:size(Mat,2)
                shift = tau(i);
                if shift == 0
                    continue
                end
                Mat(:, i) = circshift(Mat(:, i), shift);
                if shift > 0
                    Mat(1:shift,i) = 0;
                else
                    Mat(end+shift+1:end,i) = 0;
                end
            end
            SpatialResponseMatrix(ezAngleIdx, azAngleIdx) = sum(abs(sum(Mat, 2)).^2);
        end
    end



end

