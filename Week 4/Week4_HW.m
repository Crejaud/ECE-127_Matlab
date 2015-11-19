% Corentin Rejaud, Seciton #1
% Recitation Problems - Week #4, 02/17/2014
%% Problem 1 Graph 1
f=@(x) x.*exp(-x.^2);
xPoints = [-4:1:4];
yPoints = f(xPoints);
figure(1);
fplot(f, [-4,4])
hold on;
plot(xPoints, yPoints, 'r.', 'MarkerSize', 15);
hold off;
title('f(x) = x{\cdot}exp(-x^2)');
xlabel('x');
ylabel('f(x)');
xlim([-4,4]);
ylim([-0.5,0.5]);
set(gca,'xtick',xPoints);
set(gca,'ytick',[-0.5:0.1:0.5]);
grid on;
legend('f(x) = xe^{-x^2}', 'samples', 'location', 'se');

%% Problem 1 Graph 2
xmin = fminbnd(@(x)f(x), -4, 0);
ymin = f(xmin);
xmax = fminbnd(@(x)-f(x),0,4);
ymax = f(xmax);
figure(2);
fplot(f,[-4,4]);
hold on;
plot(xmin, ymin, 'r.', 'MarkerSize', 20);
plot(xmax, ymax, 'g.', 'MarkerSize', 20);
plot([xmin,xmin], [-0.6, ymin], 'r-', 'linewidth', 2);
plot([xmax, xmax], [-0.6,ymax], 'g-', 'linewidth', 2);
hold off;
title('{\itf}({\itx}) = {\itx}\cdotexp(-{\itx}^2)');
xlabel('{\itx}');
ylabel('{\itf}({\itx})');
Tr = char(['{\itx}_{min} = ',num2str(xmin,'%2.3f')]);
Tg = char(['{\itx}_{max} = +',num2str(xmax,'%2.3f')]);
legend('{\itf}({\itx}) = {\itx}\cdote^{-{\itx}^2}',Tr,Tg,'location','nw')
xlim([-4,4]);
ylim([-0.6,0.6]);
set(gca,'xtick',[-4:1:4]);
set(gca,'ytick',[-0.6:0.3:0.6]);
%% Problem 2 Part A
k1 = 0:10;
f = @(n) (n.^2).*(0.8).^n;
cumsum(f(k1),2);
%% Problem 2 Part B
g = @(n) 180 - (4.*n.^2 + 40.*n + 180).*(0.8.^n);
g(k1);
%% Problem 2 Part C
fprintf(' n      f(n)        g(n)\n');
fprintf('--------------------------\n');
fprintf('%2.0f%12.6f%12.6f\n', [k1; cumsum(f(k1),2); g(k1)]);
%% Problem 2 Part D
k2 = 0:50;
figure(3);
plot(k2,cumsum(f(k2),2),'-r',k1,cumsum(f(k1),2),'b.');
xlabel('{\itn}');
ylabel('{\itf}({\itn})');
title('{\itf}({\itn}) vs. {\itn}');
legend('{\itf}({\itn}), {\itn} = 0,1,\cdot\cdot\cdot,50','11 table values','location','se');
xlim([0,50]);
ylim([0,210]);
set(gca,'xtick',[0:10:50]);
set(gca,'ytick',[0:30:210]);
grid on;
%% Problem 2 Part E
a = @(n) (n.^2).*(0.8.^n);
figure(4);
stem(k2,a(k2),'b.');
hold on;
nmax = fminbnd(@(n)-a(n),8,10);
nmax = ceil(nmax);
amax = a(nmax);
stem(nmax,amax,'r.');
xlabel('{\itn}');
ylabel('{\ita}({\itn})');
title('{\ita}({\itn}) = {\itn}^2 (0.8)^{\itn}');
xlim([0,50]);
ylim([0,12]);
set(gca,'xtick',[0:10:50]);
set(gca,'ytick',[0:2:12]);
legend('{\ita}({\itn})', '{\itn}_{max}, {\ita}_{max}', 'location', 'ne');
T2 = char([' {\itn}_{max} = ',num2str(nmax,'%2d')], [' {\ita}_{max} = ',num2str(amax,'%7.4f')]);
text(23,6, T2,'fontsize',17,'color','r','Edgecolor','b');