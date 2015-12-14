function MGRWithTestCaseCascad(test,L,r)

[N,boundX,boundY,u] = createBoundaryCondition(testSelector(test), -1, 1, 5);
A = createLESMatrix((sqrt(N)-1)^2);
b = createRightSide(u);
linsolve(A,[2 1 1 0 0 0 1 1 2]')




