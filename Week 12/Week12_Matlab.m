%% Corentin Rejaud, Recitation Week 12
%% Question 1
% Part A
log10P = @(C,T) C(1) - ( C(2) ./ (C(3) + T) )
Ti = [250 260 270 280 290 300 310 320 330 340 350];
Pi = [260 504 1184 2910 3913 9462 18841 16952 41529 86903 77537];
ce = [10.33 1642.89 -42.85];
Pe = log10P(ce,Ti);
c0 = [1 1000 -1];
c = nlinfit(Ti,Pe, log10P, c0)
P0 = log10P(c,Ti);

figure;
plot(Ti, P0, 'r-', Ti, Pe, 'k:', Ti, log10(Pi), 'b.');
title('Antoine Equation');
xlabel('T(K)');
ylabel('log_{10}(P)');
xlim([240 360]);
ylim([2 6]);
set(gca,'xtick',[240:20:360]);
set(gca,'ytick',[2:1:6]);
grid off;
legend('nlinfit method', 'known model', 'data', 'location', 'nw');

% Part B
a = 10.33;
y = 1./(a - log10(Pi))
x = Ti;
p = polyfit(x, y, 1)
b = 1/p(1)
c = b * p(2)
figure;
C0 = [a b c];
plot(Ti, log10P(C0,Ti), 'r-', Ti, Pe, 'k:', Ti, log10(Pi), 'b.');
title('Antoine Equation');
xlabel('T(K)');
ylabel('log_{10}(P)');
xlim([240 360]);
ylim([2 6]);
set(gca,'xtick',[240:20:360]);
set(gca,'ytick',[2:1:6]);
grid off;
legend('polyfit method', 'known model', 'data', 'location', 'nw');

%% Question 2
clear all;
% Part A
xi = [1.0 1.4 1.9 2.1 2.7 3.0 3.3 3.9 4.2]';
yi = [0.18 0.21 0.21 0.20 0.20 0.19 0.18 0.16 0.16]';

A = [1./xi xi]
Y = [1./yi]

P1 = A\Y

% Part B
one = [1 1 1 1 1 1 1 1 1]';
A = [one xi.^2]
Y = [xi./yi]

P2 = A\Y

% Part C
y = @(C, X) 1 ./ (C(1)./X + C(2).*X);
C0 = [4 1];
P3 = nlinfit(xi, yi, y, C0)

% Part D
names = {'basis {x^{-1},x}'
         'basis {1, x^2}  '
         'nlinfit         '}
a = [P1(1);P2(1);P3(1)]
b = [P1(2);P2(2);P3(2)]
fprintf('   method            a        b  \n');
fprintf('---------------------------------\n');
for i = 1:3,
    fprintf('%-s   %6.4f   %6.4f\n', names{i}, a(i), b(i));
end

%% Question 3
clear all;
hi = 0:3:33
pi = [1.2 0.92 0.66 0.47 0.31 0.19 0.12 0.075 0.046 0.029 0.018 0.011]

% Part A

% plot(hi, pi, 'r-', hi, pi, 'b.');
p = polyfit(hi, log(pi), 1)
h = linspace(0,35,201);
y = exp(polyval(p,h));

figure;
plot(h, y, 'r-', hi, pi, 'b.');
grid on;
xlabel('\it{h}, km');
ylabel('\it{p}, kg/m^3');
xlim([0 35]);
ylim([0 1.6]);
set(gca,'xtick',[0:5:35]);
set(gca,'ytick',[0:0.2:1.6]);
legend('linear', 'data', 'location', 'ne');

figure;
plot(h, log(y), 'r-', hi, log(pi), 'b.');
grid on;
xlabel('\it{h}, km');
ylabel('log(\it{p})');
xlim([0 35]);
ylim([-5 1]);
set(gca,'xtick',[0:5:35]);
set(gca,'ytick',[-5:1:1]);
legend('linear', 'data', 'location', 'ne');

% Part B
p = polyfit(hi, log(pi), 2)
h = linspace(0,35,201);
y = exp(polyval(p,h));

figure;
plot(h, y, 'r-', hi, pi, 'b.');
grid on;
xlabel('\it{h}, km');
ylabel('\it{p}, kg/m^3');
xlim([0 35]);
ylim([0 1.6]);
set(gca,'xtick',[0:5:35]);
set(gca,'ytick',[0:0.2:1.6]);
legend('quadratic', 'data', 'location', 'ne');

figure;
plot(h, log(y), 'r-', hi, log(pi), 'b.');
grid on;
xlabel('\it{h}, km');
ylabel('log(\it{p})');
xlim([0 35]);
ylim([-5 1]);
set(gca,'xtick',[0:5:35]);
set(gca,'ytick',[-5:1:1]);
legend('quadratic', 'data', 'location', 'ne');

% Part C
h = [5 10]

    % Part I
r = exp(polyval(p,h))

    % Part II
spline = interp1(hi, pi, h, 'spline')

    % Part III
pchip = interp1(hi, pi, h, 'pchip')
