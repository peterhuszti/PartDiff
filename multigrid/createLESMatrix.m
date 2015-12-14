function A = createLESMatrix(N)

n = sqrt(N);
h = 2/n;

c = -1 * ones(1,N);
f = -1 * ones(1,N);
e = -1 * ones(1,N);
g = -1 * ones(1,N);
d = 4 * ones(1,N);
B = zeros(N,5);

c(1) = 0;
e(N) = 0;
f(1) = 0;
f(2) = 0;
g(N-1) = 0;
g(N) = 0;

B(1:N,1) = g;
B(1:N,2) = e;
B(1:N,3) = d;
B(1:N,4) = c;
B(1:N,5) = f;

v = [-3 -1 0 1 3];

A = full(spdiags(B,v,N,N));