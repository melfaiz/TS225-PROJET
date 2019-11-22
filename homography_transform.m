function y = homography_transform(x, v)

q = v * [x; ones(1, size(x,2))];
p = q(3,:);
y = [q(1,:)./p; q(2,:)./p];

end