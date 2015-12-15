function grid = initializeGrid(u,x)

sizeOfU = length(u);
sizeOfGrid = (sizeOfU + 4) / 4;
grid = zeros(sizeOfGrid,sizeOfGrid);

%init edge
w = sizeOfGrid - 3;

for i = 1:sizeOfGrid
    for j = 1:sizeOfGrid
        if i == 1
			grid(i,j) = u(sizeOfU - j - w);
        else
            if i == sizeOfGrid
                grid(i,j) = u(j);
                else
                    if j == 1
                        grid(i,j) = u(sizeOfU - sizeOfGrid + i + 1);
                        else
                            if j == sizeOfGrid
                                grid(i,j) = u(2 * sizeOfGrid - i);
                            end
                    end
            end
        end
    end
end

%init inside
n = sqrt(length(x));
k = 1;
j = n+1;
for m = 1:n
    for i = 2:n+1
        grid(j,i) = x(k);
        k = k + 1;
    end
    j = j - 1;
end    