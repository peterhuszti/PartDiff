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
        [boundX,boundY] = createFinerBoundCoords(boundX,boundY,fgrid);
    end
    
    
    
    A = createLESMatrix(N);
    u = getEdgeFromGrid(fgrid);
    b = createRightSide(u);
    x = zeros(1,N);
    x = GaussSeidel(A,b,r,x');

%     [X,Y] = meshgrid(boundX,boundY); 
%     surf(X,Y,fgrid);

    error = b' - A*x;
    fgrid = initializeGrid(u,error); 
    m = length(fgrid);
    dgrid = fgrid(1:2:m,1:2:m);

    fw = rec((length(dgrid)-2)^2,dgrid,r,L-2,boundX,boundY);
    x = x + fw';

%     pause;
%     grid = initializeGrid(u,x);
%     [X,Y] = meshgrid(boundX,boundY);
%     surf(X,Y,grid);

    x = GaussSeidel(A,b,r,x);

    grid = initializeGrid(u,x);
    [X,Y] = meshgrid(boundX,boundY);
    surf(X,Y,grid);
end   

