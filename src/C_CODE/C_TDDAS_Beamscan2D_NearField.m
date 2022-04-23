function SpatialResponseMatrix = C_TDDAS_Beamscan2D_NearField(MicSignals, ezAngles, azAngles, SteeringMatrix)
    SpatialResponseMatrix = zeros(length(ezAngles), length(azAngles));
    numAzAngles = numel(azAngles);
    numEzAngles = numel(ezAngles);
    parfor azAngleIdx = 1:numAzAngles
        for ezAngleIdx = 1:numEzAngles
            tau = squeeze(SteeringMatrix(ezAngleIdx, azAngleIdx,:));
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

