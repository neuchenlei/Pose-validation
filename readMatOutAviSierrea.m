function readMatOutAviSierrea()

% function: read .mat file contain the B-mode images of Sierra marker and
% output a avi file for C++ EchoFinder software to estimate the pose
% created on Dec 14, 2015



% for Sierra marker
% directoryName = 'C:\EchoSure\data\2015-03-04 Sierra pose validation data\';
savingPath = 'C:\EchoSure\data\2015-03-04 Sierra pose validation data\datasets\';


% for translation
% fileName = [savingPath 'imageMatTransX.mat'];
% saveFile = [savingPath 'imageMatTransXC.avi'];
% fileName = [savingPath 'imageMatTransY.mat'];
% saveFile = [savingPath 'imageMatTransYC.avi'];
% fileName = [savingPath 'imageMatTransZ.mat'];
% saveFile = [savingPath 'imageMatTransZC.avi'];

% for rotation
% fileName = [savingPath 'imageMatRotRocking.mat'];
% saveFile = [savingPath 'imageMatRotRockingC.avi'];
fileName = [savingPath 'imageMatRotAzimuth.mat'];
saveFile = [savingPath 'imageMatRotAzimuthC.avi'];
ims = importdata( fileName );


writerObj = VideoWriter(saveFile);%, 'uncompressed AVI');
writerObj.FrameRate = 10;
open(writerObj);
    
figure, title('');
im = uint8(ims(:,:,1));
% im = uint8(ims(:,:,6)); % for y direction translation

% for z direction translation
% im(1:150,:) = 0;
% im(360:end,:) = 0;
im(1:100,:) = 0;
im(300:end,:) = 0;
imshow(im,[]); pause(0.1);
frame = getframe; 
icounter = 0;
for i = 1:50
    icounter = icounter + 1;
    writeVideo(writerObj,frame);
end


for j = 2:size(ims,3) % 7
% for j = 2:size(ims,3     
    im = uint8(ims(:,:,j));
%     im(1:(150-j*2),:) = 0;
%     im((340-j*2):end,:) = 0;
    im(1:100,:) = 0;
    im(300:end,:) = 0;
    imshow(im,[]); pause(0.1);
    frame = getframe; 
    for nj = 1:30
        icounter = icounter + 1;
        writeVideo(writerObj,frame);
    end
end
close(writerObj);
icounter
