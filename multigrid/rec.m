function correction = rec(N,fgrid,r,L,boundX,boundY)

A = createLESMatrix(N);
u = getEdgeFromGrid(fgrid);
b = createRightSide(u);
x = zeros(1,N);
x = GaussSeidel(A,b,r,x');

boundX = boundX(1:2:length(boundX));
boundY = boundY(1:2:length(boundY));
% pause;
% [X,Y] = meshgrid(boundX,boundY);
% surf(X,Y,fgrid);


error = b' - A*x;
fgrid = initializeGrid(u,error); 
m = length(fgrid);
dgrid = fgrid(1:2:m,1:2:m);

dA = createLESMatrix((length(dgrid)-2)^2);
du = getEdgeFromGrid(dgrid);
db = createRightSide(du);
dw = dA \ db';    

dgrid = initializeGrid(du,dw);
fgrid = createFinerGrid(dgrid);
fw = convertGridToVectorWithoutEdges(fgrid);

% if L == 0
    x = x + fw';
% else
%     rec((length(dgrid)-2)^2,dgrid,r,L-1,boundX,boundY);
% end

% pause;
% grid = initializeGrid(u,x);
% [X,Y] = meshgrid(boundX,boundY);
% surf(X,Y,grid);


x = GaussSeidel(A,b,r,x);

grid = initializeGrid(u,x);
[X,Y] = meshgrid(boundX,boundY);
surf(X,Y,grid);
pause;

grid = initializeGrid(u,x);
fgrid = createFinerGrid(grid);
correction = convertGridToVectorWithoutEdges(fgrid);