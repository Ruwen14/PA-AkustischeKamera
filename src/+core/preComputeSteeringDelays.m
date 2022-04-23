function delays = preComputeSteeringDelays(phasedArrayObj, azimuthAngles, elevationAngles)
%PRECOMPUTESTEERINGDELAYS Summary of this function goes here
%   Detailed explanation goes here
delays = zeros(length(elevationAngles), length(azimuthAngles), phasedArrayObj.getNumElements());


numAzAngles = numel(azimuthAngles);
numEzAngles = numel(elevationAngles);

for azAngleIdx = 1:numAzAngles
    for ezAngleIdx = 1:numEzAngles
        delays(ezAngleIdx, azAngleIdx, 1:end) = core.calcSteeringDelay(phasedArrayObj, [azimuthAngles(azAngleIdx); elevationAngles(ezAngleIdx)]);
    end
end






% 
% 
% 
% 
% function delayMat = calcSteeringDelayMatrix(phasedArrayObj, azimuthAngle, elevationAngle)
% 
% delayMat = zeros(length(elevationAngle), length(azimuthAngle), phasedArrayObj.getNumElements);
% for elIndex = 1:length(elevationAngle)
%     for azIndex = 1:length(azimuthAngle)
%         delayMat(elIndex, azIndex, 1:end) = core.sigprocc.calcSteeringDelay(phasedArrayObj, [azimuthAngle(azIndex); elevationAngle(elIndex)]);
%     end
% end
% 
% end
% 
% 
% 
% 
% end

