function newValue = prolongation(i,j,grid)

if (mod(i,2) == 1 && mod(j,2) == 1)
	newValue = grid((i+1) / 2, (j+1) / 2);
else
	newValue = ( grid(i+1,j+1) + grid(i+1,j-1) + grid(i-1,j+1) + grid(i-1,j-1) ) / 4;
end