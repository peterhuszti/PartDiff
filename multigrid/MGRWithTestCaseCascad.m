function x = MGRWithTestCaseCascad(test,L,r)

[N,boundX,boundY,u] = createBoundaryCondition(testSelector(test), -1, 1, 5);
n = (sqrt(N)-1)^2;
A = createLESMatrix(n);
b = createRightSide(u);
x = A \ b';

grid = initializeGrid(u,x);
[X,Y] = meshgrid(boundX,boundY);
surf(X,Y,grid);

for i=1:L
    pause;
    grid = initializeGrid(u,x);
    fgrid = createFinerGrid(grid);
    N = (length(fgrid)-2)^2;
    A = createLESMatrix(N);
    u = getEdgeFromGrid(fgrid);
    b = createRightSide(u);
    x = GaussSeidel(A,b,r);
    
    [boundX,boundY] = createFinerBoundCoords(boundX,boundY,fgrid);
    [X,Y] = meshgrid(boundX,boundY);
    surf(X,Y,fgrid);
end    



