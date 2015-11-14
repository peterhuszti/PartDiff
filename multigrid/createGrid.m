function [gridX, gridY] = createGrid(x,y)

sizeOfGrid = (length(x)+4) / 4;
gridX = zeros(1,sizeOfGrid);
gridY = zeros(1,sizeOfGrid);

for i = 1:sizeOfGrid
    gridX(i) = x(i);
    gridY(i) = y(i+4);
end