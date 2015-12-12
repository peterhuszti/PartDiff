function grid = initializeGrid(u)

sizeOfU = length(u);
sizeOfGrid = (sizeOfU + 4) / 4;
grid = zeros(sizeOfGrid,sizeOfGrid);

for i = 1:sizeOfGrid
	for j = 1:sizeOfGrid
		if i == 1
			grid(i,j) = u(sizeOfU - j - 2);
		else if i == sizeOfGrid
			grid(i,j) = u(j);
            else if j == 1
				grid(i,j) = u(sizeOfU - sizeOfGrid + i + 1);
                else if j == sizeOfGrid
				grid(i,j) = u(2 * sizeOfGrid - i);
                    end
                end
             end
        end
    end
end