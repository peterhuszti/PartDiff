function x = MGR(test, L, r, type)

if(type == 1)
    x = Cascad(test,L,r);
else
    x = MGC(test,L,r);
end
