function [boundCoordsX, boundCoordsY] = getBoundCoords(x,y)

sizeOfGrid = (length(x)+4) / 4;
boundCoordsX = zeros(1,sizeOfGrid);
boundCoordsY = zeros(1,sizeOfGrid);

for i = 1:sizeOfGrid
    boundCoordsX(i) = x(i);
    boundCoordsY(i) = y(i+4);
end