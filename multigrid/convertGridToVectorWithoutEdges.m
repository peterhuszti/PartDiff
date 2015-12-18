function x = convertGridToVectorWithoutEdges(grid)

n = length(grid);
x = zeros(1,(n-2)^2);

k  = 1;
for i = n:-1:1
    for j = 1:n
        if ~(i==1 || j==1 || i==n ||j==n)
            x(k) = grid(i,j);
            k = k + 1;
        end        
    end
end