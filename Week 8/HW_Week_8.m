%% Corentin Rejaud - Recitation Week 8 - 03/24/2014
%% Question 1
clear all;
% Part A
method1 = 0;
S1 = @(k) (k + 1).*2.^k;
for N = 0:15,
    method1 = method1 + S1(N);
end
method1

method2 = 0;
N = 0;
while N <= 15,
    method2 = method2 + S1(N);
    N = N + 1;
end
method2

method3 = 0;
N = 0;
while 1,
    method3 = method3 + S1(N);
    N = N + 1;
    if N > 15,
        break
    end
end
method3

N = 0:15;
method4 = cumsum(S1(N));
method4(length(method4)) % Last element of method4

S2 = @(N) 1 + N.*2.^(N+1);
method5 = S2(15);
method5

% Part B
N = 0:15;
method1 = fsum(N,1)
method2 = fsum(N,2)
method3 = fsum(N,3)
method4 = fsum(N,4);
method4(length(method4))
method5 = fsum(N,5)

% Part C
% Forever-while loop
N = 0;
while 1,
    S = fsum(N,3);
    if S > 10^7
        break
    end
    N = N + 1;
end
N

% Conventional-while loop
N = -1; % It's -1 so when it enters the while loop, it tests 0 first
S = 0;
while S <= 10^7
    N = N + 1;
    S = fsum(N,3);
end

% Part D
f = @(N) 1 + N.*2.^(N + 1) - 10^7;
fzero(f,20)

%% Question 2
clear all;
% Part A
tol = 1e-10;
k = 1;
x(1) = 1;
while 1,
    x(k+1) = cos(x(k));
    if abs(x(k+1) - x(k)) < tol,
        break
    end
    k = k + 1;
end
k
x(k)

figure(1);
plot(1:k+1, x, 'b-', k+1, x(k+1), 'ro');
title('the iteration x(k+1) = cos(x(k))');
xlabel('iterations, \it{k}');
ylabel('\it{x}(\it{k})');
grid off;
set(gca, 'xtick', [0:10:60]);
set(gca, 'ytick', [0.2:0.1:1.0]);
xlim([0 60]);
ylim([0.2 1.0]);

figure(2);
K = 1:k;
e = abs(x(K+1) - x(K));
semilogy(K, e, 'b-', 0:1:60, tol, 'r--', 'MarkerSize', 500);
title('\it{e}(\it{k}) = |\it{x}(\it{k} + 1) - \it{x}(\it{k})|');
xlabel('iterations, \it{k}');
ylabel('\it{e}(\it{k})');
grid off;
set(gca, 'xtick', [0:10:60]);
set(gca, 'ytick', [10^-12 10^-10 10^-8 10^-6 10^-4 10^-2 10^0]);
xlim([0 60]);
ylim([10^-12 10^0]);
legend('\it{e}(\it{k})', 'tol = 10^-10', 'location', 'ne');

% Part B
tol = 1e-10;
k2 = 1;
x2(1) = 1;
x2(k2+1) = cos(x2(k2));
while abs(x2(k2+1) - x2(k2)) >= tol
    k2 = k2 + 1;
    x2(k2+1) = cos(x2(k2));
end
k2
x2(k2)

% Part C
y = @(x) cos(x) - x;
fzero(y, 1)

fprintf('%13.11f     %13.11f \n', fzero(y,1), x(k));

% Part D
xPoints = linspace(0, 2, 101);
figure(3);
plot(xPoints, cos(xPoints), 'b-', xPoints, xPoints, 'r-', fzero(y, 1), fzero(y, 1), 'm.', 'MarkerSize', 20);
title('graphical solution of x=cos(x)');
xlabel('x');
ylabel('y');
xlim([0 2]);
ylim([-0.5 2]);
set(gca, 'xtick', [0:0.5:2]);
set(gca, 'ytick', [-0.5:0.5:2]);
grid off;
legend('y = cos(x)', 'y = x', 'x = cos(x)', 'location', 'nw');

%% Question 3
% Part A
clear all;
k = 0:50;
tol = 10^-10;
fzero(@(k) f(k) - tol, 40);
kPoint = fzero(@(k) f(k) - tol, 40)
kPoint = ceil(kPoint)

figure(5);
semilogy(k, f(k), 'b-', kPoint, f(kPoint), 'r.');
grid on;
xlabel('k');
ylabel('f(k)');
title('f(k) = (k+1)/2^k');
xlim([0 50]);
ylim([10^-14 10^1]);
set(gca, 'xtick', [0:10:50]);
set(gca, 'ytick', [10^-14 10^-12 10^-10 10^-8 10^-6 10^-4 10^-2 10^0]);
legend('f(k)', char('stop point', 'tol=10^{-10}'), 'location', 'ne');

% Part B
k = 1;
S(1) = 1;
while 1,
    S(k + 1) = (k + 1)./(2.^k) + S(k);
    if abs(S(k+1) - S(k)) <= tol,
        break
    end
    k = k + 1;
end
k
S(k)

K = 1:k + 1;
K2 = 0:k;
exactPoint = fzero(@(K2) f(K2) - tol, 40)
figure(6);
plot(K2, S(K), 'b-', k, S(k), 'ro', k, 4, 'r.');
grid on;
xlabel('iterations, k');
ylabel('S(k+1)');
set(gca, 'xtick', [0:10:50]);
set(gca, 'ytick', [0:1:5]);
xlim([0 50]);
ylim([0 5]);
legend('S(k+1)', 'computed', 'exact limit', 'location', 'se');

% Part C
k = 2;
S(1) = 1;
S(2) = (1+1)/2^1 + S(1);
while abs(S(k) - S(k-1)) > tol,
    S(k+1) = (k + 1)/(2^k) + S(k);
    k = k + 1;
end
k = k - 1;
S(k)

% Part F
S_new = 1;
k = 1;
while 1,
    S_old = S_new;
    S_new = (k + 1)/(2^k) + S_old;
    if S_new - S_old <= tol
        break
    end
    k = k + 1;
end
k
S_new
E = abs(S_new - 4)

S_new = 2;
S_old = 1;
k = 1;
while S_new - S_old > tol,
    k = k + 1;
    S_old = S_new;
    S_new = (k + 1)/(2^k) + S_old;
end
k
S_new
E = abs(S_new - 4)


%% fsum
%function S = fsum(N,m)
%S1 = @(k) (k + 1).*2.^k;
%switch m
%    case 1
%        S = 0;
%        for k = N,
%            S = S + S1(k);
%        end
%    case 2
%        k = 0;
%        S = 0;
%        while k < length(N),
%            S = S + S1(k);
%            k = k + 1;
%        end
%    case 3
%        k = 0;
%        S = 0;
%        while 1,
%            S = S + S1(k);
%            k = k + 1;
%            if k > N(length(N)),
%                break
%            end
%        end
%    case 4
%        S = cumsum(S1(N));
%    case 5
%        S2 = @(N) 1 + N.*2.^(N+1);
%        S = S2(15);
%end
%end


%% f
%function S = f(k)
%
%S1 =@(k) (k + 1)./(2.^k);
%S = S1(k);
%
%end