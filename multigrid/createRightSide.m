function b = createRightSide(u)

N = (length(u)/4 - 1)^2;
n = sqrt(N);
b = zeros(1,N);

j = 2;
i = 0;
for k=1:4
    for m=1:n
        if k == 1
            i = i + 1;
        else
            if k == 2
                i = i + n;
            else
                if k == 3
                    i = i - 1;
                else
                    i = i - n;
                end
            end
        end
        b(i) = b(i) + u(j);
        
        j = j + 1;
    end
    if k == 1
            i = i - n;
        else
            if k == 2
                i = i + 1;
            else
                if k == 3
                    i = i + n;
                else
                    i = i - n;
                end
            end
    end
    j = j + 1;
end    