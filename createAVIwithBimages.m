function createAVIwithBimages()

% -------------- mat --> avi -----------------------
% 

directoryName0 = 'C:\EchoSure\data\2015-03-31 Uniform-2 pose groundtruth\Translation\';
% directoryName = [directoryName0 'TranslationX\0~-10\'];
% directoryName = [directoryName0 'TranslationY\0~-20\'];
% directoryName = [directoryName0 'TranslationZ\0~-5\'];
% ---------rotation
directoryName0 = 'C:\EchoSure\data\2015-03-31 Uniform-2 pose groundtruth\';

% directoryName0 = 'C:\EchoSure\data\2015-03-31 Uniform-2 pose groundtruth\';
% directoryName = [directoryName0 'RotationRocking\-20-0\'];
% directoryName = [directoryName0 'RotationAzimuth\-45-0\'];
% directoryName = [directoryName0 'RotationElevation\-45-0\00\'];
% directoryName = [directoryName0 'RotationElevation\-45-0\azimuth5Doppler-45~0\'];
% directoryName = [directoryName0 'RotationElevation\-45-0\azimuth-5Doppler-45-0\'];
% directoryName = [directoryName0 'RotationElevation\-45-0\azimuth10Doppler-45-0\'];
% directoryName = [directoryName0 'RotationElevation\-45-0\azimuth-10Doppler-45-0\'];
% directoryName = [directoryName0 'RotationElevation\-45-0\rocking-5Doppler-45-0\'];
% directoryName = [directoryName0 'RotationElevation\-45-0\rocking10Doppler-45-0\'];
% directoryName = [directoryName0 'RotationElevation\-45-0\rocking-10Doppler-45-0\'];
directoryName = [directoryName0 'RotationElevation\-45-0\rocking-5Doppler-45-0\'];


dd = dir([directoryName, '*.mat']);
fileName0 = 'C:\EchoSure\data\2015-03-31 Uniform-2 pose groundtruth\datasets\';

% fileName = [fileName0 'translationX.avi'];
% fileName = [fileName0 'translationY.avi'];
% fileName = [fileName0 'translationZ.avi'];
% fileName = [fileName0 'rotationRocking.avi'];
% fileName = [fileName0 'rotationAzimuth.avi'];
% fileName = [fileName0 'rotationElevation00.avi'];
% fileName = [fileName0 'rotationElevationAzimuth5.avi'];
% fileName = [fileName0 'rotationElevationAzimuth-5.avi'];
% fileName = [fileName0 'rotationElevationAzimuth10.avi'];
% fileName = [fileName0 'rotationElevationAzimuth-10.avi'];
% fileName = [fileName0 'rotationElevationRocking5.avi'];
% fileName = [fileName0 'rotationElevationRocking10.avi'];
% fileName = [fileName0 'rotationElevationRocking-10.avi'];
% fileName = [fileName0 'rotationElevationRocking-5.avi'];



writerObj = VideoWriter(fileName);%, 'uncompressed AVI');
writerObj.FrameRate = 10;
open(writerObj);
    
figure, title('');
% for j = 1:length(dd)
% translation 0~-10: 1 0 -1 ... -10, in total 12 files
ind = 1; % 11 21 6 1
for j = 2:length(dd)-3
% for j = length(dd):-1:3
    fileName = dd(j).name;
    if length(fileName) > 13
    else
        ims = importdata([directoryName fileName]);
        im = uint8(ims(:,:,10));
        imMat(:,:,ind) = im;
%         ind = ind - 1;
        ind = ind + 1;
        imshow(im,[]); pause(0.1);
        frame = getframe; 
        writeVideo(writerObj,frame);
    end

end
% close(writerObj);
% % save([fileName0 'translationXright.mat'], 'imMat');
% save([fileName0 'translationYin.mat'], 'imMat');
% % read 0~10

% directoryName = [directoryName0 'TranslationX\0-10\'];
% directoryName = [directoryName0 'TranslationY\0-20\'];
% directoryName = [directoryName0 'TranslationZ\0-5\'];
%---------- rotation
% directoryName = [directoryName0 'RotationRocking\0-20\'];
% directoryName = [directoryName0 'RotationAzimuth\0-45\'];
% directoryName = [directoryName0 'RotationElevation\0-45\00\'];
% directoryName = [directoryName0 'RotationElevation\0-45\azimuth5Doppler0-45\'];
% directoryName = [directoryName0 'RotationElevation\0-45\azimuth-5Doppler0-45\'];
% directoryName = [directoryName0 'RotationElevation\0-45\azimuth10Doppler0-45\'];
% directoryName = [directoryName0 'RotationElevation\0-45\azimuth-10Doppler0-45\'];
% directoryName = [directoryName0 'RotationElevation\0-45\rocking5Doppler0-45\'];
% directoryName = [directoryName0 'RotationElevation\0-45\rocking10Doppler0-45\'];
directoryName = [directoryName0 'RotationElevation\0-45\rocking-10Doppler0-45\'];

dd = dir([directoryName, '*.mat']);

% % fileName = [fileName0 'translationXleft.avi'];
% fileName = [fileName0 'translationYout.avi'];
% writerObj1 = VideoWriter(fileName);%, 'uncompressed AVI');
% writerObj1.FrameRate = 10;
% open(writerObj1);
    
% ind = 21; % 12 22 7 21
for j = 2:length(dd)-1
    fileName = dd(j).name;
    if length(fileName) > 13
    else
        ims = importdata([directoryName fileName]);
        im = uint8(ims(:,:,10));
        imMat(:,:,ind) = im;
        ind = ind + 1;
        imshow(im,[]); pause(0.1);
        frame = getframe; 
        writeVideo(writerObj,frame);
    end

end
close(writerObj);

% save([fileName0 'translationX.mat'], 'imMat');
% save([fileName0 'translationY.mat'], 'imMat');
% save([fileName0 'translationZ.mat'], 'imMat');
% save([fileName0 'rotationRocking.mat'], 'imMat');
% save([fileName0 'rotationAzimuth.mat'], 'imMat');
% save([fileName0 'rotationElevation00.mat'], 'imMat');
% save([fileName0 'rotationElevationAzimuth5.mat'], 'imMat');
% save([fileName0 'rotationElevationAzimuth-5.mat'], 'imMat');
% save([fileName0 'rotationElevationAzimuth10.mat'], 'imMat');
% save([fileName0 'rotationElevationAzimuth-10.mat'], 'imMat');
% save([fileName0 'rotationElevationRocking5.mat'], 'imMat');
% save([fileName0 'rotationElevationRocking10.mat'], 'imMat');
save([fileName0 'rotationElevationRocking-10.mat'], 'imMat');
% save([fileName0 'rotationElevationRocking-5.mat'], 'imMat');

% videoPath = 'C:\EchoSure\data\2014-11-05\';
% % videofile = 'imageMatTransY.avi';
% videofile = '12-39-08.avi';
% xyObj = VideoReader([videoPath videofile]);
% nFrames = xyObj.NumberOfFrames;
% vidHeight = xyObj.Height;
% vidWidth = xyObj.Width;
% 
% figure, title('');
% for k = 1:nFrames
%     imc = read(xyObj,k); 
%     imshow(imc);
% end