function [y,p,q] = homography_transform(x, v)

q = v * [x; 1];
p = q(3,:);
y = [q(1,:)./p; q(2,:)./p];

end