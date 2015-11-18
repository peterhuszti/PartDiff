function finerGrid = createFinerGrid(grid)

finerGrid = zeros(length(grid),length(grid));

for i = 1:length(finerGrid)
	for j = 1:length(finerGrid)
		if (mod(i,2) == 0 && mod(j,2) == 0)
			prolongation(i,j,grid);
		end
	end
end

for i = 1:length(finerGrid)
	for j = 1:length(finerGrid)
		if (mod(i,2) == 1 || mod(j,2) == 1)
			prolongation(i,j,grid);
		end
	end
end