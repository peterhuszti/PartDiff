function [finerBoundCoordsX,finerBoundCoordsX] = createFinerBoundCoords(boundCoordsX,boundCoordsY)

finerBoundCoordsX = zeros(1, 2*length(boundCoordsX) - 1);
finerBoundCoordsY = zeros(1, 2*length(boundCoordsY) - 1);

for i = 1:length(finerGridX)
    if mod(i,2) == 1
        finerBoundCoordsX(i) = boundCoordsX(floor(i/2) + 1);
        finerBoundCoordsY(i) = boundCoordsY(floor(i/2) + 1);
    else
        finerBoundCoordsX(i) = (finerBoundCoordsX(i-1) + boundCoordsX(floor((i+1)/2) + 1)) / 2;
        finerBoundCoordsY(i) = (finerBoundCoordsY(i-1) + boundCoordsY(floor((i+1)/2) + 1)) / 2;
    end
end    