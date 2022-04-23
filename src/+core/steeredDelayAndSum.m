function sumOfSignals = steeredDelayAndSum(micSignals, micArray, azezAngle, fs, weights)
    if nargin < 5
        weights = repelem(1, size(micSignals, 2))';
    end
    
    timeDelays = core.calcSteeringDelay(micArray, azezAngle);
    delayedMicSignals = core.fastSampleShift(micSignals, round(-timeDelays*fs));
    sumOfSignals = delayedMicSignals * weights;
end


