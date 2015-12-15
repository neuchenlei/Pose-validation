% clear all

directoryName = 'C:\EchoSure\data\2015-03-04 Sierra pose validation data\translation\TranslationY\';
dd = dir([directoryName, '*pose.mat']);

% for rotation
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

% for translation
sepY = 20;
sepX = 10;
sepZ = 5;

sep = sepY;
icounter = 0;
for i = length(dd):-1:sep+2
    icounter = icounter + 1;
    fileName = dd(i).name;
    pmat(:,:,icounter) = importdata([directoryName fileName] );
    if icounter > 1
        transPmat(:,:,icounter-1) = inv(pmat(:,:,icounter-1)) * pmat(:,:,icounter);
    end
    
    cvvData = importdata([directoryName fileName(1:end-8) '.mat'] );
    imageMat(:,:,icounter) = cvvData(:,:,10);
end

for i = 1:sep
    icounter = icounter + 1;
    fileName = dd(i).name;
    pmat(:,:,icounter) = importdata([directoryName fileName] );

    transPmat(:,:,icounter-1) = inv(pmat(:,:,icounter-1)) * pmat(:,:,icounter);
    
    cvvData = importdata([directoryName fileName(1:end-8) '.mat'] );
    imageMat(:,:,icounter) = cvvData(:,:,10);
end


save([directoryName 'poseMat.mat'], 'pmat');
save([directoryName 'transPoseMat.mat'], 'transPmat');
% save([directoryName 'imageMatRotRocking.mat'], 'imageMat');
save([directoryName 'imageMatTransY.mat'], 'imageMat');

