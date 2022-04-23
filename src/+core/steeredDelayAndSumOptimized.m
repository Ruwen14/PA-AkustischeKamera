function sumOfSignals = steeredDelayAndSumOptimized(micSignals, fs, timeDelays)
    weights = repelem(1, size(micSignals, 2))';
   
    delayedMicSignals = core.fastSampleShift(micSignals, round(-timeDelays*fs));
    sumOfSignals =1/16*( delayedMicSignals * weights);
end
