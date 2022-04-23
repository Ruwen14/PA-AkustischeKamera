params= load('data\params.mat').params;
if isLocked(audioDeviceReader)
    release(audioDeviceReader)
end
deviceReader = audioDeviceReader('Driver','ASIO','Device',...
    'MOTU Pro Audio','NumChannels',params.NumberChannels,'SamplesPerFrame',...
    params.SamplesPerFrame,'SampleRate', params.SampleRate,'BitDepth',...
    '24-bit integer','ChannelMappingSource','Property','ChannelMapping',...
    params.ChannelMapping);              % Es werden alle spezifischen Einstellungen eingestellt

setup(deviceReader)  
player = audioDeviceWriter('SampleRate',params.SampleRate);


while true
    [input,numOverrun] = deviceReader();
    player(input(:, 1));
    


end





