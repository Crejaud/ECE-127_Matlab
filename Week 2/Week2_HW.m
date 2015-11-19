%% Corentin Rejaud, Section #1
% Recitation Problems - Week #2, 01/28/2013
%% Problem 1
X = [2 6 5 2
8 3 1 5
3 5 3 6
5 9 7 1
8 7 2 4]
% Part A
[colmax, rowNum] = max(X)
% When there are two entries in a column that are equal to the maximum of
% that column, max(X) only looks at the first one (top to bottom)
% Part B
[rowmin, colNum] = min(X,[],2)
% Part C
rowmax = max(X,[],2)
colmax = max(X)
[matMax, colNum] = max(colmax)
[matMax, rowNum] = max(rowmax)
% (4,2)
% Part D
meanCol = mean(X)
meanRow = mean(X,2)
meanMatrix = mean(meanRow)
% Part E
sumCol = sum(X)
sumRow = sum(X,2)
sumMatrix = sum(sumRow)
% Part F
cumsumCol = cumsum(X,1)
cumsumRow = cumsum(X,2)
% Part G
sortColAscending = sort(X,1,'ascend')
sortColDescending = sort(X,1,'descend')
% Part H
Y = sortrows(X,-3)
% Part I
Y = sortrows(X',4)
Y'
%% Problem 2
f = @(x) exp(x) - 4*x.^2
F = @(x) exp(x) - 8*x % Derivative of f
% Part A
% Method 1
x = linspace(-1, 4, 101);
[fmin1,imin] = min(f(x));
xmin1 = x(imin);
% Method 2
[xmin2,fmin2] = fminbnd(f,-1,4);
% Method 3
xmin3 = fzero(F,4);
fmin3 = f(xmin3);
% Printing
methods = [1, 2, 3];
xmin = [xmin1, xmin2, xmin3];
fmin = [fmin1, fmin2, fmin3];
fprintf('method   xmin         fmin\n')
fprintf('-----------------------------\n')
fprintf('  %d    %8.6f    %10.6f\n', [methods; xmin; fmin])
% Part B
% Method 1
x = linspace(-1, 4, 101);
[fmax1,imax] = max(f(x));
xmax1 = x(imax);
% Method 2
[xmax2, fmax2] = fminbnd(@(x) - f(x), -1, 4);
fmax2 = -fmax2;
% Method 3
xmax3 = fzero(F,-1);
fmax3 = f(xmax3);
% Printing
methods = [1, 2, 3];
xmax = [xmax1, xmax2, xmax3];
fmax = [fmax1, fmax2, fmax3];
fprintf('method   xmax         fmax\n')
fprintf('-----------------------------\n')
fprintf('  %d    %8.6f    %10.6f\n', [methods; xmax; fmax])
% Part C
MinX = fzero(F,4);
MinY = f(MinX);
MaxX = fzero(F,-1);
MaxY = f(MaxX);
x = linspace(-1,4,101);
y = exp(x)-4*x.^2;
xPoint = fzero(@(x) f(x)+5,1);
yPoint = -5;
plot(x,y, 'b-', MaxX, MaxY, 'ro', MinX, MinY, 'rs', xPoint, yPoint, 'go')
xlabel('x')
ylabel('f(x)')
title('maximum and minimum of f(x) = e^x - 4x^2')
set(gca, 'xtick', [-1:1:4])
set(gca, 'ytick', [-20:5:5])
grid on
ylim([-20 5])
legend('f(x) = e^x - 4x^2','maximum','minimum', 'f(x) = -5','location','sw')