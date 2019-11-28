function bg = projection(bg,fg,H)

%   Add fg to bg using the homography matrix H 
%   bg is the background image (bugger than fg)
%   fg is the image we want to transform into bg
%   H is the homography matrix !! INVERSE

x_max = size(bg,2); 
y_max = size(bg,1);

x2_max = size(fg,2); 
y2_max = size(fg,1);

bg = double(bg);
fg =  double(fg);

OUT = getPoints(bg);
IN = [1 1;size(fg,2) 1;size(fg,2) size(fg,1);1 size(fg,1)];

H = homography_solve(OUT',IN');




M = zeros(1,1,2);

for i=1:x_max
    for j=1:y_max
        
        P = homography_transform([i;j], H);  
        
        P = round(P);        
        
        M(i,j,:) = [P(1),P(2)];       
        
    end
end

for i=1:x_max
    for j=1:y_max
        
        a = M(i,j,1) ;    
        b = M(i,j,2) ; 
        
          if a>1 && b>1 && b<y2_max && a<x2_max
        
            bg(j,i,:)= fg(b,a,:);            
           
          end
        
    end
end

end

