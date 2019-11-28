

%% Projection d'une image vers une image de taille plus grande

clear all;clc; close all;

bg = imread('images/panneau.jpg');
fg = imread('images/car.jpg');

bg = projection(bg,fg);

figure,imshow(uint8(bg));


%% Projection sur un cadre vide

clear all;
clc; close all;

% Load images.
buildingDir = fullfile(toolboxdir('vision'), 'visiondata', 'building');
buildingScene = imageDatastore(buildingDir);

% Display images to be stitched
A = readimage(buildingScene, 1);
B = readimage(buildingScene, 2);


%uint8 to double
A = double(A);
B = double(B);

load('building.mat')

H = homography_solve(OUT',IN');


%fonction homographie M

x2_max = size(B,2); 
y2_max = size(B,1);



x_max = size(A,2); 
y_max = size(A,1);


M = zeros(1,1,2);

for i=1:x_max
    for j=1:y_max
        
        P = homography_transform([i;j], H);  
        
        P = round(P);
        
        M(i,j,:) = [P(1),P(2)];
       
    end
end

% X = [];
% Y = [];
% 
% for i=1:x_max
%     for j=1:y_max
%         
%         a = M(i,j,1) ;    
%         b = M(i,j,2) ;
%         
%         if a>1 && b>1 && b<y2_max && a<x2_max
%             
%             X = [X i];
%             Y = [Y j];
%         
%         end
%         
%     end
% end


res = zeros(1,1,3) ;

for i=1:x_max
    for j=1:y_max
        
        a = M(i,j,1) ;    
        b = M(i,j,2) ;   
        
        if a>1 && b>1 && b<y2_max && a<x2_max
              
              
              A(j,i,:)= B(b,a,:);       

        end
        
        
    end
end


figure, imshow(uint8(A));
