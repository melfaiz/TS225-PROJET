clc; close all;

bg = imread('images/panneau.jpg');
fg = imread('images/boud.jpg');

figure,imshow(uint8(fg));
[in_x,in_y] = getpts;
IN = [in_x in_y];

figure,imshow(uint8(bg));
[out_x,out_y] = getpts;
OUT = [out_x out_y];
axis on

close all;
bg = double(bg);
fg =  double(fg);

H = homography_solve(IN',OUT');

bg = homography_image(bg,fg,H);

figure,imshow(uint8(bg));

