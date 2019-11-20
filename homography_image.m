function bg = homography_image(bg,fg,H)
%   Add fg to bg using the homography matrix H 
%   bg is the background image (bugger than fg)
%   fg is the image we want to transform into bg
%   H is the homography matrix
%   tab is the new location of fg into bg

x_max = size(fg,2); 
y_max = size(fg,1);

for i=1:x_max
    for j=1:y_max
        Pp = homography_transform([i;j], H);
        
        p = round(Pp');
        if p(1)>0 && p(2)>0
            bg(p(2),p(1),:) = fg(j,i,:);
        end

            
    end
end


end

