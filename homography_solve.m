function H = homography_solve(in, out)

n = size(in, 2);

if n < 4
    error('you need at least 4 points');
end

x = in(1,:); %entree
y = in(2,:);
X = out(1,:); %sortie
Y = out(2,:);

rows0 = zeros(3, n)';
Mxy = [x; y; ones(1,n)]';
rowsxX = -[x.*X]';
rowsxY = -[x.*Y]';
rowsyX = -[y.*X]';
rowsyY = -[y.*Y]';


Ax = [Mxy rows0 rowsxX rowsyX];
Ay = [rows0 Mxy rowsxY rowsyY];

A = [Ax;Ay];

B = [X Y]';

H = inv(A'*A)*A'*B;
H1 = [H' 1]';

H = (reshape(H1 , 3, 3)).';
end