function result = extraction(image,taille,nom)

%   Extrait une partie de image et le met dans un fichier nom.jpg
%   l'image d'ou en extrait 
%   la taille de la nouvelle image
%   le nom du fichier .jpg


%uint8 to double
image = double(image);

image1Points = getPoints(image);

w = taille(2);
l = taille(1);
result = zeros(w,l,3);


OUT = [1 1;l 1;l w;1 w]  ;

H = homography_solve(OUT',image1Points');



x_r = size(result,2); 
y_r = size(result,1);

x_im = size(image,2); 
y_im = size(image,1);


M = zeros(1,1,2);

for i=1:x_r
    for j=1:y_r
        
        P = homography_transform([i;j], H);  
        
        P = round(P);        
        
        M(i,j,:) = [P(1),P(2)];       
    
    end
end



for i=1:x_r
    for j=1:y_r
        
        a = M(i,j,1) ;    
        b = M(i,j,2) ; 
        
          if a>1 && b>1 && b<y_im && a<x_im
        
            result(j,i,:)= image(b,a,:);            
           
          end
        
    end
end

imwrite(uint8(result),nom)

end