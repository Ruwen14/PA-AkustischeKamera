function phaseShift = calcSteeringVector(phasedArrayObj, frequency, AziEveAngle)
    azang = AziEveAngle(1,:);
    elang = AziEveAngle(2,:);  

    % angles defined in local coordinate system
    % see http://www.labbookpages.co.uk/audio/beamforming/delayCalc.html
    incidentdir = [-cosd(elang).*cosd(azang);...
        -cosd(elang).*sind(azang);...
        -sind(elang)];

    tau = phasedArrayObj.getElementPosition.'*incidentdir/340;
    phaseShift = exp(-1i*2*pi*frequency*tau);
end

