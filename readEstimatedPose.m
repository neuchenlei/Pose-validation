function readEstimatedPose()
% read the estimated pose by C++ Echofinder software

path = 'C:\EchoSure\data\2015-03-04 Sierra pose validation data\transPose\';
% trackerFileName = [path 'calPoseTransX.txt'];
% idx(1) = 49;
% for i = 1:20
%     idx(i+1) = idx(1)+ i*30;
% end
% trackerFileName = [path 'calPoseTransY.txt'];
% idx(1) = 49; % the 6th frame
% for i = 1:35
%     idx(i+1) = idx(1)+ i*30;
% end
% trackerFileName = [path 'calPoseTransZ.txt'];
% idx(1) = 49;
% for i = 1:10
%     idx(i+1) = idx(1)+ i*30;
% end

% for rotation
% trackerFileName = [path 'calPoseRocking.txt'];
% idx(1) = 49; 
% for i = 1:30
%     idx(i+1) = idx(1)+ i*30;
% end

trackerFileName = [path 'calPoseAzimuth.txt'];
idx(1) = 49; 
for i = 1:90
    idx(i+1) = idx(1)+ i*30;
end

transMat = textread(trackerFileName,'%s','whitespace', '\t'); %f
% obtain the time stamp of optical tracker
for i = 1:floor(length(transMat))
    tmp = sscanf(transMat{i},'%f')';
    calPose(:,:,i) = vec16ToMat(tmp(1:12));
end

% for translation --------------------
% calPoseMatTransX = calPose(:,:,idx(1:end));
% % calPoseMatTransX = calPose(:,:,idx(1:end-3)); % for y translation
% transX = squeeze(calPoseMatTransX(1,4,:));%X
% % transX = squeeze(calPoseMatTransX(3,4,1:25));%Y
% % transX = squeeze(calPoseMatTransX(2,4,:));%Z
% 
% % change the step size
% stepSize = 1:5;
% 
% for j = 1:length(stepSize)
%     idxStep = 1:stepSize(j):length(transX);
%     offsetX{j} = transX(idxStep(1:end-1))-transX(idxStep(2:end));
% end
% 
% for k = 1:length(stepSize)
%     tmp = offsetX{k};
%     statResults(k,:) = [mean(tmp) std(tmp)];
% end
% 
% % display
% figure, plot(statResults(:,1),'ro')
% hold on,
% % plot(1:5, 'g+')
% errorbar(1:5,statResults(:,1),statResults(:,2))
% xlabel('Robot step mm')
% ylabel('Estimated translation mm')
% % title('Estimeated translation along X, the step size from 1 to 5 mm')
% % title('Estimeated translation along Y, the step size from 1 to 5 mm')
% title('Estimeated translation along Z, the step size from 1 to 5 mm')
% % calPoseMatTransY = calPoseMatTransX;
% % calPoseMatTransZ = calPoseMatTransX;
% mean(offsetX)
% std(offsetX)
% mean(offsetX(1:25))
% std(offsetX(1:25))

% save([path 'calPoseMatTransX.mat'],'calPoseMatTransX')
% save([path 'calPoseMatTransY.mat'],'calPoseMatTransY')
% save([path 'calPoseMatTransZ.mat'],'calPoseMatTransZ')

% for rotation
calPoseMatRot = calPose(1:3,1:3,idx);
for j = 1:size(calPoseMatRot,3)
    calrod = calPoseMatRot(1:3,1:3,j);
    [r_xyz(3),r_xyz(2), r_xyz(1)] = decompose_rotation_d(calrod);
    rotXYZ(j,:) = r_xyz;
end
% rotX = rotXYZ(:,1);
rotY = rotXYZ(:,2);
% rotDegree = rotX(2:end) - rotX(1:end-1);
% change the step size
stepSize = 1:5;

for j = 1:length(stepSize)
%     idxStep = 1:stepSize(j):length(rotX);
    idxStep = 1:stepSize(j):length(rotY);
    rotDegree{j} = rotY(idxStep(2:end))-rotY(idxStep(1:end-1));
end

for k = 1:length(stepSize)
    tmp = rotDegree{k};
    statResultsRot(k,:) = [mean(tmp) std(tmp)];
end

% display
figure, plot(statResultsRot(:,1),'ro')
hold on,
% plot(1:5, 'g+')
errorbar(1:5,statResultsRot(:,1),statResultsRot(:,2))
xlabel('Robot step')
ylabel('Estimated rotation')
% title('Estimeated rotation around Y, the step size from 1 to 5 degree')
title('Estimeated rotation around Z, the step size from 1 to 5 degree')
% save([path 'calPoseMatRocking.mat'],'rotX')

% rotY = rotXYZ(:,2);
% rotDegree = rotY(2:end) - rotY(1:end-1);
save([path 'calPoseMatAzimuth.mat'],'rotY')
mean(rotDegree)
std(rotDegree)

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

