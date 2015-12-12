function [N,boundX,boundY,u] = createBoundaryCondition(testFunction,LO,HI,density)

N = 4*density - 4;

boundX = linspace(LO,HI,density);
boundY = linspace(LO,HI,density);

u = zeros(1,N);

for i = 1:density
    u(i) = testFunction(i, 1);
end    
for i = 2:density
    u(i+density-1) = testFunction(density, i);
end    
for i = 2:density
    u(i + 2*density - 2) = testFunction(density-i+1, density);
end    
for i = 2:density-1
    u(i + 3*density - 3) = testFunction(1, density-i+1);
end    