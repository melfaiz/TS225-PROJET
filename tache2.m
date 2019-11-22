clear all ;clc; close all;

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



%calcul du decalage negatif
% Mx = M(:,:,1);
% xm = - min(min(Mx(:)),0);
% My = M(:,:,2);
% ym = - min(min(My(:)),0);

%matrice de resultat final


% copie de A dans resultat 
% for i=1:size(A,1)
%     for j=1:size(A,2)
%         resultat(i,j,:)=A(i,j,:);
%     end
% end

% Mx = M(:,:,1);
% xm = - min(min(Mx(:)),0);
% My = M(:,:,2);
% ym = - min(min(My(:)),0);

% M(:,:,1) = M(:,:,1)+xm;
% M(:,:,2) = M(:,:,2)+ym;


resultat = ones(1,1,3);
% B dans resultat selon M
for i=1:x_max
    for j=1:y_max
        
            a = M(i,j,1) ;    
            b = M(i,j,2) ; 
        
             if  b<y2_max && a<x2_max
        
                    resultat(j,i,:)= B(b,a,:);            
           
             end
        
    end
end

figure, imshow(uint8(resultat));