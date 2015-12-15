function compareRot()

directoryName = 'C:\EchoSure\data\2015-03-04 Sierra pose validation data\transPose\';
rr = dir([directoryName, '*Rocking*.mat']);

% tt = dir([directoryName, '*.txt']);

delimiterIn = ' ';
headerlinesIn = 0;
calPose = importdata([directoryName rr(1).name],delimiterIn, headerlinesIn);
realPose = importdata([directoryName rr(2).name],delimiterIn, headerlinesIn);

for i = 1: size(calPose,3)
    calrod = rodrigues(calPose(1:3,1:3,i));
%     readrod = rodrigues(realPose(1:3,1:3,i));

    rotd(i) = calrod(2) - 0.0175;
end

mean(rotd)
std(rotd)