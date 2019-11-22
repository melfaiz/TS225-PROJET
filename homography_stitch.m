function resultat = homography_stitch(A,B,H)
%HOMOGRAPHY_STITCH Summary of this function goes here
%   Detailed explanation goes here

resultat = ones(1,1,3);

for i=1:size(A,1)
    for j=1:size(A,2)
        resultat(i,j,:)=A(i,j,:);
    end
end

x_max = size(B,2); 
y_max = size(B,1);
% 
% xm = size(A,2); 


for i=1:x_max
    for j=1:y_max
        Pp = homography_transform([i;j], H);
        
        p = round(Pp');
        
        if p(1)>0 && p(2)>0
            resultat(p(2),p(1),:) = B(j,i,:);
        end
%         if p(2)<0
%             
%             v= abs(p(2))
%             resultat = padarray(resultat,v);
%         end
    end
end


end

