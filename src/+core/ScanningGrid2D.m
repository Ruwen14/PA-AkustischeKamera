function ScanGrid = ScanningGrid2D(sensorWidth_mm, sensorHeight_mm, focalLength_mm, scanDistance_m, angRes_dgr)
    % Öffnungswinkel - Kamera (see:
    % https://rechneronline.de/optische-geraete/objektiv.php)
    azimuthAngAperture= 2*atand(sensorWidth_mm/(2*focalLength_mm));
    elevationAngAperture = 2*atand(sensorHeight_mm/(2*focalLength_mm));

    azimuthScanAngles = -round(azimuthAngAperture)/2:angRes_dgr:round(azimuthAngAperture)/2;
    elevationScanAngles = flip(-round(elevationAngAperture)/2:angRes_dgr:round(elevationAngAperture)/2);

    ScanGrid.ScanDistance = scanDistance_m;
    ScanGrid.AzimuthScanAngles = azimuthScanAngles;
    ScanGrid.ElevationScanAngles = elevationScanAngles;

    ScanGrid.ScanPointsX = tand(azimuthScanAngles)*scanDistance_m;
    ScanGrid.ScanPointsY = tand(elevationScanAngles)*scanDistance_m;
    ScanGrid.ScanPointsZ = scanDistance_m;
end