function poseValidation()

directoryName = 'C:\EchoSure\data\2015-03-04 Sierra pose validation data\transPose\';
dd = dir([directoryName, '*MatTrans*.mat']);

tt = dir([directoryName, '*.txt']);

delimiterIn = ' ';
headerlinesIn = 0;
calPose = importdata([directoryName tt(1).name],delimiterIn, headerlinesIn);
ic = 0;
for i = 30:size(calPose,1)
    ic= ic+1;
    pmat(1,1:4,ic) = calPose(i,1:4);
    pmat(2,1:4,ic) = calPose(i,5:8);
    pmat(3,1:4,ic) = calPose(i,9:12);
    pmat(4,1:4,ic) = calPose(i,13:16);
    if ic > 1
    transPmat(:,:,ic-1) = inv(pmat(:,:,ic-1)) * pmat(:,:,ic);
    end
    
end
save([directoryName 'calPoseMatRotAzimuth.mat'], 'transPmat');


% for i = 1:length(dd)
%     fileName = dd(i).name;
%     pmat(:,:,i) = importdata([directoryName fileName] );
%     if i > 1
%         transPmat(:,:,i-1) = inv(pmat(:,:,i-1)) * pmat(:,:,i);
%     end
%     
%     cvvData = importdata([directoryName fileName(1:end-8) '.mat'] );
%     imageMat(:,:,i) = cvvData(:,:,10);
% end

% for rotation
figure,
% X axis
% for i = 1:length(dd)
    fileName = dd(1).name;
    transPose = importdata([directoryName fileName] );
    for j = 1:size(transPose,3)
        mat = transPose(:,:,j);
        plot(mat(1,4),mat(2,4),'rx'); hold on
    end
% end
% Y axis
    fileName = dd(2).name;
    transPose = importdata([directoryName fileName] );
    for j = 1:size(transPose,3)
        mat = transPose(:,:,j);
        plot(mat(1,4),mat(2,4),'go'); hold on
    end
% Z axis
%     fileName = dd(3).name;
%     transPose = importdata([directoryName fileName] );
%     for j = 1:size(transPose,3)
%         mat = transPose(:,:,j);
%         plot(mat(3,4),'b+'); hold on
%     end
hold off