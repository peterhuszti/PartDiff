function correction = rec(N,fgrid)

A = createLESMatrix(N);
u = getEdgeFromGrid(fgrid);
b = createRightSide(u);
x = zeros(1,N);
x = GaussSeidel(A,b,r,x');

[X,Y] = meshgrid(boundX,boundY);
surf(X,Y,fgrid);

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

x = x + fw';

pause;
grid = initializeGrid(u,x);
[X,Y] = meshgrid(boundX,boundY);
surf(X,Y,grid);

x = GaussSeidel(A,b,r,x);

pause;
grid = initializeGrid(u,x);
[X,Y] = meshgrid(boundX,boundY);
surf(X,Y,grid);
