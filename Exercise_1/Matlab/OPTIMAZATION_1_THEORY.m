%% Functions initialize f1,f2,f3

euler=2.71828;

syms x;

f1= (x-2)^2 - sin(x+3);
f2=  euler^(-5*x) + (x+2)*(cos(0.5*x)*cos(0.5*x));
f3= (x^2)*sin(x+2) - (x+1)^2;

%% Plots-Graphs of f1,f2,f3 Functions
figure(1)
fplot(f1,[2,5],'LineWidth',1.5);
title('Function f1(x) Graph');
ylabel('$f1(x)$','Interpreter','latex','fontsize',12);
xlabel('$x$','Interpreter','latex','fontsize',12);
hold on;
hold off;


figure(2)
fplot(f2,[2,5],'LineWidth',1.5);
title('Function f2(x) Graph');
ylabel('$f2(x)$','Interpreter','latex','fontsize',12);
xlabel('$x$','Interpreter','latex','fontsize',12);
hold on;
hold off;


figure(3)
fplot(f3,[2,5],'LineWidth',1.5);
title('Function f3(x) Graph');
ylabel('$f3(x)$','Interpreter','latex','fontsize',12);
xlabel('$x$','Interpreter','latex','fontsize',12);
hold on;
hold off;

%%1 - Derivatives of f1,f2,f3 Functions
df1=diff(f1,'x');
df2=diff(f2,'x');
df3=diff(f3,'x');

%%2 - Derivatives of f1,f2,f3 Functions
d2f1=diff(df1,'x');
d2f2=diff(df2,'x');
d2f3=diff(df3,'x');

%% Plots-Graphs of d2f1,d2f2,d2f3 2-Derivatives of Functions f1,f2,f3
figure(4)
fplot(d2f1,[2,5],'LineWidth',3);
title('Function d2f1(x)/dx Graph');
ylabel('$d2f1(x)/dx $','Interpreter','latex','fontsize',12);
xlabel('$x$','Interpreter','latex','fontsize',12);
hold on;
hold off;

figure(5)
fplot(d2f2,[2,5],'LineWidth',3);
title('Function d2f2(x)/dx Graph');
ylabel('$d2f2(x)/dx$','Interpreter','latex','fontsize',12);
xlabel('$x$','Interpreter','latex','fontsize',12);
hold on;
hold off;

figure(6)
fplot(d2f3,[2,5],'LineWidth',3);
title('Function d2f3(x)/dx Graph');
ylabel('$d2f3(x)/dx$','Interpreter','latex','fontsize',12);
xlabel('$x$','Interpreter','latex','fontsize',12);
hold on;
hold off;

%%subs(d2f1,d)
%subs(d2f2,d)
%subs(d2f3,d)

