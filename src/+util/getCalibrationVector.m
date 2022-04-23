function calibvec = getCalibrationVector(calibFilesDir)
    % Example: calibevec = getCalibrationVector(pwd + "\+util\Calibration");
    numFiles = size(dir(fullfile(calibFilesDir, '*.mat')),1);
    calibvec = zeros(1, numFiles);
    all(calibvec(:) == 0)
    
    for m = 1:numFiles
        calibvec(:, m) = load(calibFilesDir + "\" +sprintf('CalibrationMeasurment_MIC_%d.mat', m)).CalibrationMeas.calibrationFactor;
    end
    if all(calibvec(:) == 0)
        warning("No Files Found");
        return
    end
end
