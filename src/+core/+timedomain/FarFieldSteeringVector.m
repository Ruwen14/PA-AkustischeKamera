function sv = FarFieldSteeringVector(MicCoords, AziEveAngle)
% Function Implementation copied from phased.ElementDelay.stepImpl
% identical to array = phased.URA('Size',[4 4],'ElementSpacing',[0.1 0.1]);
% delay = test.ElementDelay2("SensorArray", array, "PropagationSpeed", 340.0);
% tau = delay([-30;-20]);
    azang = AziEveAngle(1,:);
    elang = AziEveAngle(2,:);
   
    
    % angles defined in local coordinate system
    % see http://www.labbookpages.co.uk/audio/beamforming/delayCalc.html
    incidentdir = [-cosd(elang).*cosd(azang);...
        -cosd(elang).*sind(azang);...
        -sind(elang)];
 
    % same as (transpose(phasedArrayObj.getElementPosition) * incidentdir)/sonicSpeed
    sv = MicCoords.'*incidentdir/340;
    %tau is in [ms]
end

