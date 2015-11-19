function y = f2(x)
y = zeros(size(x));

i1 = find(abs(x) <= 1);
y(i1) = 1;

i2 = find(1<abs(x)&abs(x)<=3);
y(i2) = exp(-abs(x(i2)) + 1);
end