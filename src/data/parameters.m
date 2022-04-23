
% Z, X, Y
mic(1,:)  = [0 -0.25 0.255];
mic(2,:)  = [0 -0.27 0.075];
mic(3,:)  = [0 -0.35 -0.045];
mic(4,:)  = [0 -0.235 -0.22];
mic(5,:)  = [0 -0.05 0.255];
mic(6,:)  = [0 -0.06 0.075];
mic(7,:)  = [0 -0.16 -0.045];
mic(8,:)  = [0 -0.065 -0.22];
mic(9,:)  = [0 0.15 0.255];
mic(10,:) = [0 0.065 0.075];
mic(11,:) = [0 0.135 -0.045];
mic(12,:) = [0 0.065 -0.22];
mic(13,:) = [0 0.275 0.255];
mic(14,:) = [0 0.235 0.075];
mic(15,:) = [0 0.35 -0.045];
mic(16,:) = [0 0.27 -0.22];

params.MicCartCoords = mic';
params.AzimuthScanAngles= -45:45;
params.ElevationScanAngles = -30:30;
params.NumberChannels = 16;
params.SamplesPerFrame = 1000;
params.SampleRate = 48000;
params.ChannelMapping = [1:16]; 

params.CalibrationVector = [2.6849085946357358 2.8097819899702206 3.0290411788642371 ...
                     2.5831854058067956 2.793206683538815 2.7059048993793775 ...
                     2.5025984407809529 2.5209402432173706 2.3471208970579078 ...
                     2.2683378283519522 2.8759010697062859 3.8215563293449248 ...
                     2.7739091415721995 2.65129730588339 2.7157610226724094 ...
                     2.4748143414859349];





% core.sigprocc.calcSteeringDelayMatrix



% 
% params.MicCartCoords = mic';
% params.AzimuthScanAngles = AzimuthScanAngles;
% params.ElevationScanAngles = ElevationScanAngles;

% params.SteeringDelayMatrix = core.sigprocc.calcSteeringDelayMatrix()


savepath = append(fileparts(mfilename("fullpath")), "\params.mat");

save(savepath, "params");


disp("Loaded Params")

% Expose parameters into Workspace; as they are faster access than nested
% structs
% obwohl ist eigentlich egal weil wirs ja eh in funktionen reinkpoieren


% serialize(params);
% 
% function serialize(params)
%     savepath = append(fileparts(mfilename("fullpath")), "\params.mat");
%     save(savepath, "params");
% end










