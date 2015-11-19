function y = f3(x)

if abs(x) <= 1
    y = 1;
elseif 1<abs(x)&abs(x)<=3
    y = exp(-abs(x)+1);
else
    y = 0;
end
end