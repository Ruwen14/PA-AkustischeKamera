function playAudioData(data, sampleRate)
    player = audioplayer(data, sampleRate);
    playblocking(player)
end

