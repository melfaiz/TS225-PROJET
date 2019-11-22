clear all ;clc; close all;

%% Extraction d'une image à partir d'une image plus grande

image = imread('images/car.jpg');

image1 = extraction(image,[500 300],'images/extraction.jpg');

figure,imshow(uint8(image1));


