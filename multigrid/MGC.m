function x = MGC(test,L,r)

if(test == -1)
    %TODO
else
    [N,boundX,boundY,u] = createBoundaryCondition(testSelector(test), -1, 1, 5);
    
    for i=1:L 
        n = (length(u)/4 - 1)^2;
        x = zeros(1,n);
        grid = initializeGrid(u,x);
        fgrid = createFinerGrid(grid);
        u = getEdgeFromGrid(fgrid);
        N = (length(fgrid)-2)^2;
    end
    
    A = createLESMatrix(n);
    u = getEdgeFromGrid(fgrid);
    b = createRightSide(u);
    x = GaussSeidel(A,b,r);
    
    error = b - A*x;
    fgrid = initializeGrid(u,error); 
    correction = restriction(fgrid);
    
    w = prolongation(correction);
    
    x = x + wp;
    
%    [N,boundX,boundY,u] = createBoundaryCondition(testSelector(test), -1, 1, 5);
%    n = (sqrt(N)-1)^2;
%    A = createLESMatrix(n);
%    b = createRightSide(u);
%    x = A \ b';
% 
%    grid = initializeGrid(u,x);
%    [X,Y] = meshgrid(boundX,boundY);
%    surf(X,Y,grid);
% 
%    for i=1:L
%        pause;
%        grid = initializeGrid(u,x);
%        fgrid = createFinerGrid(grid);
%        N = (length(fgrid)-2)^2;
%        A = createLESMatrix(N);
%        u = getEdgeFromGrid(fgrid);
%        b = createRightSide(u);
%        x = GaussSeidel(A,b,r);
% 
%        [boundX,boundY] = createFinerBoundCoords(boundX,boundY,fgrid);
%        [X,Y] = meshgrid(boundX,boundY);
%        surf(X,Y,fgrid);
%    end    
end   
