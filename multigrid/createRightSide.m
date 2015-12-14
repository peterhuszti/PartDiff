function b = createRightSide(u)

N = (sqrt(length(u))-1)^2;
n = sqrt(length(u)) - 1;
b = zeros(1,N);

j = 2;
i = 0;
for k=1:4
    for m=1:n
        if k == 1
            i = i + 1;
        else
            if k == 2
                i = i + 3;
            else
                if k == 3
                    i = i - 1;
                else
                    i = i - 3;
                end
            end
        end
        b(i) = b(i) + u(j);
        
        j = j + 1;
    end
    if k == 1
            i = i - 3;
        else
            if k == 2
                i = i + 1;
            else
                if k == 3
                    i = i + 3;
                else
                    i = i - 3;
                end
            end
    end
    j = j + 1;
end    



