function x = GaussSeidel(A,b,r)

n = length(b);
x = zeros(n,1);

for k = 1:r
	for i = 1:n
		j = 1:n;
		j(i) = [];
		temp = x;
		temp(i) = [];
		x(i) = (b(i) - sum(A(i,j) * temp)) / A(i,i);
	end
end