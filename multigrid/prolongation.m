function pv = prolongation(v)	
%D->F

n = length(v);
pv = zeros(1, 2*n - 1);

grid = initializeGrid(v); %TODO
finerGrid = createFinerGrid(grid);
pv = convertGridToVectorWithoutEdges(finerGrid); %TODO