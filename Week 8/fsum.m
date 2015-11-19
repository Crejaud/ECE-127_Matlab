function S = fsum(N,m)
S1 = @(k) (k + 1).*2.^k;
switch m
    case 1
        S = 0;
        for k = N,
            S = S + S1(k);
        end
    case 2
        k = 0;
        S = 0;
        while k < length(N),
            S = S + S1(k);
            k = k + 1;
        end
    case 3
        k = 0;
        S = 0;
        while 1,
            S = S + S1(k);
            k = k + 1;
            if k > N(length(N)),
                break
            end
        end
    case 4
        S = cumsum(S1(N));
    case 5
        S2 = @(N) 1 + N.*2.^(N+1);
        S = S2(15);
end
end