%% Corentin Rejaud - Recitation Week 7 - 3/10/2014
%% Question 1
A = [6 7 7 8
1 7 1 7
8 4 3 3
9 6 1 9
7 2 1 1];
B = [9 4 2
2 2 6
6 8 3
5 3 6
1 5 7];
C = [9;4;8;3;6];
% Part A
Aindex = find(A>7);
Bindex = find(B>7);
Cindex = find(C>7);
[Ai, Aj] = find(A>7);
[Bi, Bj] = find(B>7);
[Ci, Cj] = find(C>7);
% Part B
A(find(A>=7)) = 70;
B(find(B>=7)) = 70;
C(find(C>=7)) = 70;
% Part C
A = [6 7 7 8
1 7 1 7
8 4 3 3
9 6 1 9
7 2 1 1];
B = [9 4 2
2 2 6
6 8 3
5 3 6
1 5 7];
C = [9;4;8;3;6];
[Arow, Acol] = find(A>2 & A< 5);
[Brow, Bcol] = find(B>2 & B< 5);
[Crow, Ccol] = find(C>2 & C< 5);
A(find(A>2 & A< 5));
B(find(B>2 & B< 5));
C(find(C>2 & C< 5));
aNumElem = length(find(A>2 & A< 5));
bNumElem = length(find(B>2 & B< 5));
cNumElem = length(find(C>2 & C< 5));
% Part D
aNumElem2 = length(find(A==3));
bNumElem2 = length(find(B==3));
cNumElem2 = length(find(C==3));
[Arow2, Acol2] = find(A==3);
[Brow2, Bcol2] = find(B==3);
[Crow2, Ccol2] = find(C==3);

%% Question 2
% Method 1
f = @(x) 1.*(abs(x) <= 1) + exp(-abs(x) + 1).*(1 < abs(x) & abs(x) <= 3)
x = linspace(-4,4,801);
figure(1);
plot(x, f(x), 'b-');
set(gca,'xtick', [-4:1:4]);
set(gca,'ytick', [0:0.25:1.25]);
xlim([-4,4]);
ylim([0,1.25]);
title('method 1');
xlabel('x');
ylabel('f(x)');
grid on;

% Part C
figure(2);
plot(x, f(x), 'b-', x-8, f(x), 'b-', x+8, f(x), 'b-');
xlim([-14,14]);
ylim([0,1.25]);
set(gca,'xtick', [-12:4:12]);
set(gca,'ytick', [0:0.25:1.25]);
grid on;
title('f(x-8) + f(x) + f(x+8)');
xlabel('x');
ylabel('f(x)');

% Method 2
x = linspace(-4,4,801);
y = f2(x);

figure(3);
plot(x,y, 'b-');
set(gca,'xtick', [-4:1:4]);
set(gca,'ytick', [0:0.25:1.25]);
xlim([-4,4]);
ylim([0,1.25]);
title('method 2');
xlabel('x');
ylabel('f(x)');
grid on;

% Method 3
x = linspace(-4,4,801);

for n=1:length(x)
    y3(n) = f(x(n));
end

figure(4);
plot(x,y,'b-');
set(gca,'xtick', [-4:1:4]);
set(gca,'ytick', [0:0.25:1.25]);
xlim([-4,4]);
ylim([0,1.25]);
title('method 3');
xlabel('x');
ylabel('f(x)');
grid on;

%% f2.m
%function y = f2(x)
%y = zeros(size(x));

%i1 = find(abs(x) <= 1);
%y(i1) = 1;

%i2 = find(1<abs(x)&abs(x)<=3);
%y(i2) = exp(-abs(x(i2)) + 1);
%end

%% f3.m
%function y = f3(x)

%if abs(x) <= 1
    %y = 1;
%elseif 1<abs(x)&abs(x)<=3
    %y = exp(-abs(x)+1);
%else
    %y = 0;
%end
%end