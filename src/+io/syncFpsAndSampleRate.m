function audioSamplesPerFrame = syncFpsAndSampleRate(fps, sampleRate)
audioSamplesPerFrame = round(sampleRate/fps);
fprintf("Synced samplesPerFrame of Audio to %d to match Framerate of %d \n", audioSamplesPerFrame, fps)

end

