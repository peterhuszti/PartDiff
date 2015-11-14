function selectedTestCase = testSelector(i)

switch i
    case 1 
        selectedTestCase = @(x,y)(1);
    case 2
        selectedTestCase = @(x,y)(x);
    case 3
        selectedTestCase = @(x,y)(y);
    case 4
        selectedTestCase = @(x,y)(x - 3*y);
    case 5
        selectedTestCase = @(x,y)(x*y);
    case 6
        selectedTestCase = @(x,y)(x^2 * y^2);
    case 7
        selectedTestCase = @(x,y)(log((x+1)^2 + y^2));
    otherwise
        warning('Invalid test number!')
end
        