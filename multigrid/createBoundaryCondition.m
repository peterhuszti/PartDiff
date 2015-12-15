function [N,boundX,boundY,u] = createBoundaryCondition(testFunction,LO,HI,density)

N = 4*density - 4;

boundX = linspace(LO,HI,density);
boundY = linspace(LO,HI,density);

u = zeros(1,N);

for i = 1:density
    u(i) = testFunction(boundX(i), boundY(1));
end    
for i = 2:density
    u(i+density-1) = testFunction(boundX(density), boundY(i));
end    
for i = 2:density
    u(i + 2*density - 2) = testFunction(boundX(density-i+1), boundY(density));
end    
for i = 2:density-1
    u(i + 3*density - 3) = testFunction(boundX(1), boundY(density-i+1));
end    