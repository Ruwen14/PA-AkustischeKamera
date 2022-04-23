function sv = NearFieldSteeringVector(MicCoords, cartPosX, cartPosY, cartPosZ)
    MicX = MicCoords(2,:);
    MicY = MicCoords(3,:);
    MicZ = MicCoords(1,:);

    dist = sqrt((cartPosX - MicX).^2 + (cartPosY - MicY).^2 + (cartPosZ - MicZ).^2) ...
        - sqrt(cartPosX^2 + cartPosY^2 + cartPosZ^2);
    sv = dist / 340;
end

