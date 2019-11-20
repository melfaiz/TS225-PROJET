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

% subplot(131), imshow(uint8(A));
% subplot(132), imshow(uint8(B));
% subplot(133), imshow(uint8(C));


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

% init resultat et copie de A dans resultat
resultat = ones(1,1,3);

% for i=1:size(A,1)
%     for j=1:size(A,2)
%         resultat(i,j,:)=A(i,j,:);
%     end
% end



%fonction homographie
M = zeros(1,1,2);

x_max = size(B,2); 
y_max = size(B,1);

for i=1:x_max
    for j=1:y_max
        Pp = homography_transform([i;j], H);        
        p = round(Pp);        
        M(i,j,:) = [p(1),p(2)];       
        
    end
end



% B dans resultat selon M
for i=1:x_max
    for j=1:y_max
        p(1) = M(i,j,1) ;    
        p(2) = M(i,j,2) ; 
        if p(1)>0 && p(2)>0
        resultat(p(2),p(1),:) = B(j,i,:);
        end
    end
end

figure, imshow(uint8(resultat));




