function correction = restriction(fgrid)
%F->D
n = length(fgrid);
grid = zeros(floor(n\2),floor(n\2));

for i = 1:n
	for j = 1:n
        if (mod(i,2) == 1 && mod(j,2) == 1)
            grid( (i+1)/2, (j+1)/2 ) = finerGrid(i,j);
        else
            if (mod(i,2) == 0 && mod(j,2) == 1)
                ( grid(i/2, (j+1)/2 ) + grid((i+2)/2, (j+1)/2 ) ) /2 = finerGrid(i,j);
            else
                if (mod(j,2) == 0 && mod(i,2) == 1)
                    ( grid((i+1)/2, j/2) + grid((i+1)/2, (j+2)/2) ) /2 = finerGrid(i,j);
                else
                    ( grid(i/2, j/2) + grid(i/2, (j+2)/2) + grid((i+2)/2, j/2) + grid((i+2)/2, (j+2)/2) ) / 4 = finerGrid(i,j);
                end
            end
        end
	end
end

A = createLERMatrix(N);
correction = A \ convertGridToVectorWithoutEdges(grid); %MGC