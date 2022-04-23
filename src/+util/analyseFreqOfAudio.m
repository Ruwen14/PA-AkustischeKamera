parameters;
% PARAMS
% -----------------------------------------------------------------
params = load('data\params.mat').params;

% PARAMS
% -----------------------------------------------------------------
videoFReader = vision.VideoFileReader("recordings/WhiteNoise.avi", 'AudioOutputPort', true, 'AudioOutputDataType', 'double');


player = audioDeviceWriter('SampleRate',params.SampleRate);

dummyImage = 255*ones(1200,1600,3,'double');
outstream = imshow(dummyImage); 

while ~isDone(videoFReader)
    tic

    [frame, input] = videoFReader();   
    player(input(:, 14));

   
   if ishandle(outstream)
        frame = insertText(frame,[0 0], sprintf('%0.1f fps\n',1000/(toc*1000)),'FontSize',18,...
        'BoxOpacity',0.4,'TextColor','white');
        set(outstream, "CData", frame)
   else
       break
   end
    drawnow;
%     fprintf('%0.5f ms\n',toc*1000)
%      axis image 
end