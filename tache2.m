clc; close all;

% Load images.
buildingDir = fullfile(toolboxdir('vision'), 'visiondata', 'building');
buildingScene = imageDatastore(buildingDir);

% Display images to be stitched
A = readimage(buildingScene, 1);
B = readimage(buildingScene, 2);
C = readimage(buildingScene, 3);

%uint8 to double
A = double(A);
B = double(B);
C = double(C);

subplot(131), imshow(uint8(A));
subplot(132), imshow(uint8(B));
subplot(133), imshow(uint8(C));

% 
% figure,imshow(uint8(A));
% [in_x,in_y] = getpts;
% OUT = [in_x in_y];
% close all;
% 
% figure,imshow(uint8(B));
% [out_x,out_y] = getpts;
% IN = [out_x out_y];
% 
% close all;



H = homography_solve(IN',OUT');

resultat = homography_stitch(A,B,H);

% figure,imshow(uint8(resultat));
% [in_x,in_y] = getpts;
% OUT2 = [in_x in_y];
% close all;
% 
% figure,imshow(uint8(C));
% [out_x,out_y] = getpts;
% IN2 = [out_x out_y];
% 
% close all;

H2 = homography_solve(IN2',OUT2');

resultat = homography_stitch(resultat,C,H2);

figure, imshow(uint8(resultat));




