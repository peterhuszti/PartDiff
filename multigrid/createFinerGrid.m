function finerGrid = createFinerGrid(grid)

finerGrid = zeros(2*length(grid)-1, 2*length(grid)-1);

for i = 1:length(finerGrid)
	for j = 1:length(finerGrid)
        if (mod(i,2) == 1 && mod(j,2) == 1)
            finerGrid(i,j) = grid( (i+1)/2, (j+1)/2 );
        else
            if (mod(i,2) == 0 && mod(j,2) == 1)
                finerGrid(i,j) = ( grid(i/2, (j+1)/2 ) + grid((i+2)/2, (j+1)/2 ) ) /2;
            else
                if (mod(j,2) == 0 && mod(i,2) == 1)
                    finerGrid(i,j) = ( grid((i+1)/2, j/2) + grid((i+1)/2, (j+2)/2) ) /2;
                else
                    finerGrid(i,j) = ( grid(i/2, j/2) + grid(i/2, (j+2)/2) + grid((i+2)/2, j/2) + grid((i+2)/2, (j+2)/2) ) / 4;
                end
            end
        end
	end
end