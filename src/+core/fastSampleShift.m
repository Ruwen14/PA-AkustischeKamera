function Mat = fastSampleShift(Mat,delayVec)
    for i = 1:size(Mat,2)
        shift = delayVec(i);
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
end
