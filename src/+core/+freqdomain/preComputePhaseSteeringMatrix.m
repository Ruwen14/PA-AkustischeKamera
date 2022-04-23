function PhaseSteeringMatrix = preComputePhaseSteeringMatrix(sensorArray,azimuthAngles, elevationAngles, freqs_fft)
    PhaseSteeringMatrix = cell(length(elevationAngles), length(azimuthAngles));
    
    numAzAngles = numel(azimuthAngles);
    numEzAngles = numel(elevationAngles);
    for azAngleIdx = 1:numAzAngles
        for ezAngleIdx = 1:numEzAngles
            delayVec = core.calcSteeringDelay(sensorArray, [azimuthAngles(azAngleIdx); elevationAngles(ezAngleIdx)]);
            phaseShift = exp(-1i*2*pi*delayVec*freqs_fft)';
            PhaseSteeringMatrix{ezAngleIdx, azAngleIdx} = phaseShift;
        end
    end    
end



