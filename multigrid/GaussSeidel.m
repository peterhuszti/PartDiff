function x = GaussSeidel(A,c,r)

n = length(c);
x = zeros(n,1);

for k = 1:r
	for i = 1:n
		j = 1:n;
		j(i) = [];
		temp = x;
		temp(i) = [];
		x(i) = (c(i) - sum(A(i,j) * temp)) / A(i,i);
	end
end