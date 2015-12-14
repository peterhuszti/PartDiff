function MGR(test, L, r, type)

if(test == -1)
    if(type == 1)
        MGRWithBoundaryConditionCascad(L,r);
    else
        MGRWithBoundaryConditionMGC(L,r);
    end
else
    if(type == 1)
        MGRWithTestCaseCascad(test,L,r);
    else
        MGRWithTestCaseMGC(test,L,r);
    end
end