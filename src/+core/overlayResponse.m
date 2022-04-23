function overlay = overlayResponse(responseMat, parentFrame, cmap, fast)

    rgbResponse = util.mapMat2Img(responseMat, cmap);
    [height, width, ~] = size(parentFrame);
    
    minr = min(responseMat(:));
    maxr = max(responseMat(:));
    ncol = size(cmap,1);                            
    s = round(1+(ncol-1)*(responseMat-minr)/(maxr-minr));
    A = (s-1)/255*1.2;
   
    if fast
        overlay = imresize(A.*rgbResponse, [height, width]) + parentFrame;
    else
        A = imresize(A, [height, width]);
        scaledRgbMat = imresize(rgbResponse, [height, width]);
        overlay = A.*scaledRgbMat + (1-A).*parentFrame;  
    end
end

