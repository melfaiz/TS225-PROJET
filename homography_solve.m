function H = homography_solve(in, out)

n = size(in, 2);

if n < 4
    error('you need at least 4 points');
end

x = out(1, :); %sortie
y = out(2,:);
X = in(1,:); %entree
Y = in(2,:);

rows0 = zeros(3, n);
rowsXY = -[X; Y; ones(1,n)];

Ax = [rowsXY; rows0; x.*X; x.*Y; x];
Ay = [rows0; rowsXY; y.*X; y.*Y; y];

A = [Ax Ay];

if n == 4
    [U, ~, ~] = svd(A);
else
    [U, ~, ~] = svd(A, 'econ');
end

H = (reshape(U(:,9), 3, 3)).';

end