function [N,x,y,u] = scanBoundaryCondition()

inputFile = fopen('E:\ELTE\_MSC 3\ParcDiff\generateBoundaryCondition\grid.txt', 'r');

skip = '';
while strcmp(skip,'@') == 0
    skip = fscanf(inputFile, '%s', 1);
end

N = fscanf(inputFile, '%d', 1);

x = zeros(1,N);
y = zeros(1,N);
u = zeros(1,N);

for i = 1:N
    x(i) = fscanf(inputFile, '%f', 1);
    y(i) = fscanf(inputFile, '%f', 1);
    u(i) = fscanf(inputFile, '%f', 1);
end    

fclose(inputFile);