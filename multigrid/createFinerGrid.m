function [finerGridX,finerGridY] = createFinerGrid(gridX,gridY)

finerGridX = zeros(1, 2*length(gridX) - 1);
finerGridY = zeros(1, 2*length(gridY) - 1);

for i = 1:length(finerGridX)
    if mod(i,2) == 1
        finerGridX(i) = gridX(floor(i/2) + 1);
        finerGridY(i) = gridY(floor(i/2) + 1);
    else
        finerGridX(i) = (finerGridX(i-1) + gridX(floor((i+1)/2) + 1)) / 2;
        finerGridY(i) = (finerGridY(i-1) + gridY(floor((i+1)/2) + 1)) / 2;
    end
end    