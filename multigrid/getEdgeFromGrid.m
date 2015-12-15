function u = getEdgeFromGrid(grid)

sizeOfGrid = length(grid);
sizeOfU = 4 * (sizeOfGrid-1);
u = zeros(1,sizeOfU);

% i = 1;
% k = sizeOfGrid;
% m = 1;
% for j=1:4
%     for n=1:
%     u(i) = grid(k,m);
%     i = i + 1;
%     m = m + 1;
% end    

w = sizeOfGrid - 3;

 for i = 1:sizeOfGrid
    for j = 1:sizeOfGrid
        if i == 1
			u(sizeOfU - j - w) = grid(i,j);
        else
            if i == sizeOfGrid
                u(j) = grid(i,j);
                else
                    if j == 1
                        u(sizeOfU - sizeOfGrid + i + 1) = grid(i,j);
                        else
                            if j == sizeOfGrid
                                u(2 * sizeOfGrid - i) = grid(i,j);
                            end
                    end
            end
        end
    end
 end  