function viewSensorArray3D(sArray, title)

if nargin < 2
    title = "Array Geometry";
end
figure;
viewArray(sArray,'ShowNormal',true,...
  'ShowTaper',true,'ShowIndex','All',...
  'ShowLocalCoordinates',true,'ShowAnnotation',true,...
  'Orientation',[0;0;0], "Title", title);
end

