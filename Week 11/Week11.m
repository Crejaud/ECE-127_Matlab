%% Corentin Rejaud, Recitation Week 11
%% Question 1
% Part A
clear all;
Tci = [-20, 0, 20, 40, 70, 100, 200, 300, 400, 500];
Ti = Tci + 273.15;
vi = [1.63, 1.71, 1.82, 1.87, 2.03, 2.17, 2.53, 2.98, 3.32, 3.64];
y1 = Ti.^(3/2) ./ vi;
x1 = Ti;
C = polyfit(x1, y1, 1);
a1 = C(1)
b1 = C(2)

v = @(T) T.^(3/2) ./ (a1.*T + b1);
figure;
plot(Tci, v(Ti), 'r-', Tci, vi, 'b.');
title('viscosity - polyfit method');
xlabel('T_{c}');
ylabel('\it{v}');
xlim([-40 550]);
ylim([1.5 4]);
set(gca, 'xtick', [-20, 40, 100, 200, 300, 400, 500]);
set(gca, 'ytick', [1.5:.5:4]);
grid on;
legend('model', 'data', 'location', 'se');

% Part B
A = [Ti.^(-1/2)' , Ti.^(-3/2)'];
Y = (1./vi)';
p = A\Y
a2 = p(1)
b2 = p(2)

v = @(T) T.^(3/2) ./ (a2.*T + b2);
figure;
plot(Tci, v(Ti), 'r-', Tci, vi, 'b.');
title('viscosity - basis functions method');
xlabel('T_{c}');
ylabel('\it{v}');
xlim([-40 550]);
ylim([1.5 4]);
set(gca, 'xtick', [-20, 40, 100, 200, 300, 400, 500]);
set(gca, 'ytick', [1.5:.5:4]);
grid on;
legend('model', 'data', 'location', 'se');

% Part C
f = @(c,T) T.^(3/2) ./ (c(1).*T + c(2));
ce = [6.5 870.5];

rng(201);
yi = f(ce,Ti) + 0.2*randn(size(Ti));

c0 = [6 870]';

c = nlinfit(Ti, yi, f, c0);
a3 = c(1)
b3 = c(2)

v = @(T) T.^(3/2) ./ (a3.*T + b3);
figure;
plot(Tci, v(Ti), 'r-', Tci, vi, 'b.');
title('viscosity - nlinfit method');
xlabel('T_{c}');
ylabel('\it{v}');
xlim([-40 550]);
ylim([1.5 4]);
set(gca, 'xtick', [-20, 40, 100, 200, 300, 400, 500]);
set(gca, 'ytick', [1.5:.5:4]);
grid on;
legend('model', 'data', 'location', 'se');

% Part D
a = [a1, a2, a3];
b = [b1, b2, b3];
S = {'polyfit', 'basis functions', 'nlinfit'}
fprintf('   a         b       method\n');
fprintf('------------------------------------\n');
for i=1:3,
    fprintf(' %6.4f   %8.4f   %s \n', a(i), b(i), S{i});
end

%% Question 2
clear all;
h = [0 8 16 24 32 40];
r = [1.2250 0.5258 0.1665 0.0469 0.0136 0.0040];
P = [101325.00 35651.62 10352.83 2971.75 889.06 287.14];
T = [288.15 236.22 216.65 220.56 228.49 250.35];

hi = 0:4:40;

ri= interp1(h, r, hi);
Pi= interp1(h, P, hi);
Ti= interp1(h, T, hi);

fprintf('  h      rho         P        T\n');
fprintf('(km)  (kg/m^3)     (Pa)      (K)\n');
fprintf('----------------------------------\n');
fprintf(' %2.0f    %6.4f   %9.2f   %6.2f\n', [hi; ri; Pi; Ti]);
%% Question 3
clear all;
M = [1 3 5 7 9 12]
Y = [1971 1973 1975]
T = [27.0 40.1 61.4 77.8 71.6 40.8
    35.5 46.4 59.5 77.4 69.5 39.0
    37.3 40.2 65.8 75.8 64.2 35.9]
mi = [1 2 3 4 5 6 7 8 9 10 11 12];
yi = [1971 1972 1973 1974 1975];
[Mi, Yi] = meshgrid(mi, yi);

Ti = interp2(M,Y,T,Mi,Yi)

fprintf('year  jan   feb   mar   apr   may   jun   jul   aug   sep   oct   nov   dec \n');
fprintf('----------------------------------------------------------------------------\n');
fmt = ['%4.0f', repmat('  %4.1f',1,12),'\n'];
fprintf(fmt, [yi', Ti]');

fprintf('\n');

Ti1 = interp1(Y, T, yi);
fprintf('year  jan   feb   mar   apr   may   jun   jul   aug   sep   oct   nov   dec \n');
fprintf('----------------------------------------------------------------------------\n');
% fmt = '%4.0f  %4.1f         %4.1f         %4.1f         %4.1f         %4.1f                  %4.1f\n';
fprintf('%4.0f  %4.1f        %4.1f        %4.1f        %4.1f        %4.1f              %4.1f\n', [yi', Ti1]');
Ti2 = interp1(M, Ti1', mi);
Ti2 = Ti2';

fprintf('\n');

fprintf('year  jan   feb   mar   apr   may   jun   jul   aug   sep   oct   nov   dec \n');
fprintf('----------------------------------------------------------------------------\n');
fmt = ['%4.0f', repmat('  %4.1f',1,12),'\n'];
fprintf(fmt, [yi', Ti2]');
%% Extra Question
% Part A
clear all;
N = 120;
y0 = 100000;
x = 1000;
eq1 = @(r) (1+r).^N - x./(x - r.*y0);
r = fzero(eq1, 6/1200)

% Part B
y(1) = y0;
iTotal = 0;
for k = 2:N+1,
    y(k) = (1+r)*y(k-1)-x;
    i(k-1) = r*y(k-1);
    iTotal = i(k-1) + iTotal;
end
i(k) = r*y(k);
iTotal = i(k) + iTotal;
pTotal = iTotal + y0;
k = 1:N+1;
fprintf(' n       y(k)      interest\n');
fprintf('---------------------------\n');
for k = 1:N+1;
    fprintf('%3.0f   %9.2f      %6.2f\n', [k, y(k), i(k)]);
end
fprintf('---------------------------\n');
fprintf(' total interest:   %8.2f\n', iTotal);
fprintf(' total payments:  %9.2f\n', pTotal);

% Part C

r = 6/1200;
eq2 = @(N) (1+r).^N - x./(x - r.*y0);
N = fzero(eq2, 120);
N = ceil(N)

y2(1) = y0;
k = 2;
i2Total = 0;
while 1,
    y2(k) = (1+r)*y2(k-1)-x;
    i2(k-1) = r*y2(k-1);
    i2Total = i2(k-1) + i2Total;
    k = k + 1;
    if k == N+2,
        break;
    end
end
i2(N+1) = r*y2(N+1);
i2Total = i2(N+1) + i2Total;
p2Total = i2Total + y0;        

k = 1:N+1;
fprintf(' n       y(k)      interest\n');
fprintf('---------------------------\n');
for k = 1:N+1;
    fprintf('%3.0f   %9.2f      %6.2f\n', [k, y2(k), i2(k)]);
end
fprintf('---------------------------\n');
fprintf(' total interest:   %8.2f\n', i2Total);
fprintf(' total payments:  %9.2f\n', p2Total);
