function readEstimatedPose()
% read the estimated pose by C++ Echofinder software

path = 'C:\EchoSure\data\2015-03-04 Sierra pose validation data\transPose\';
% trackerFileName = [path 'calPoseTransX.txt'];
% idx(1) = 49;
% for i = 1:20
%     idx(i+1) = idx(1)+ i*30;
% end
trackerFileName = [path 'calPoseTransY.txt'];
idx(1) = 49; % the 6th frame
for i = 1:35
    idx(i+1) = idx(1)+ i*30;
end
% trackerFileName = [path 'calPoseTransZ.txt'];
% idx(1) = 49;
% for i = 1:10
%     idx(i+1) = idx(1)+ i*30;
% end

transMat = textread(trackerFileName,'%s','whitespace', '\t'); %f
% obtain the time stamp of optical tracker
for i = 1:floor(length(transMat))
    tmp = sscanf(transMat{i},'%f')';
    calPose(:,:,i) = vec16ToMat(tmp(1:12));
end

calPoseMatTransX = calPose(:,:,idx(1:end-3));
% transX = squeeze(calPoseMatTransX(1,4,:));
transX = squeeze(calPoseMatTransX(3,4,:));
% transX = squeeze(calPoseMatTransX(2,4,:));
offsetX = transX(1:end-1)-transX(2:end);
calPoseMatTransY = calPoseMatTransX;
% calPoseMatTransZ = calPoseMatTransX;
% mean(offsetX)
% std(offsetX)
mean(offsetX(1:25))
std(offsetX(1:25))

% save([path 'calPoseMatTransX.mat'],'calPoseMatTransX')
save([path 'calPoseMatTransY.mat'],'calPoseMatTransY')
% save([path 'calPoseMatTransZ.mat'],'calPoseMatTransZ')
function matTrans = vec16ToMat(pts_vector)

matTrans(1,1) = pts_vector(1);
matTrans(1,2) = pts_vector(2);
matTrans(1,3) = pts_vector(3);

matTrans(2,1) = pts_vector(5);
matTrans(2,2) = pts_vector(6);
matTrans(2,3) = pts_vector(7);

matTrans(3,1) = pts_vector(9);
matTrans(3,2) = pts_vector(10);
matTrans(3,3) = pts_vector(11);

matTrans(1,4) = pts_vector(4);
matTrans(2,4) = pts_vector(8);
matTrans(3,4) = pts_vector(12);

matTrans(4,1) = 0;
matTrans(4,2) = 0;
matTrans(4,3) = 0;
matTrans(4,4) = 1;

