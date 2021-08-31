clc;
clear;

%% Function initialize f
syms x y;

f=(x^3)*(exp((-(x^2) - (y^4))));
disp("f =");pretty(f)

%% Plot-Graph of f Function.

figure(1)
fhandle = fcontour(f);
title('F(x,y)');
ylabel('$ y $','Interpreter','latex','fontsize',12);
xlabel('$ x $','Interpreter','latex','fontsize',12);
grid on
axis equal


%% 1 - Derivatives of f Function for x and for y.
dfx=diff(f,'x');
disp("dfx/dx =");pretty(dfx)
dfy=diff(f,'y');
disp("dfy/dy =");pretty(dfy)

df=[dfx;dfy];

%% Plot-Graph 1 - Derivatives of f .
figure(2)
dfxhandle = fcontour(df);
title('dF(x,y)/dx and dF(x,y)/dx');
ylabel('$ y $','Interpreter','latex','fontsize',12);
xlabel('$ x $','Interpreter','latex','fontsize',12);
grid on
axis equal


%%2 - Derivatives of f Function
d2f=diff(df,'x','y');

%% Plot-Graph of d2f Function
figure(3)
d2fxhandle = fcontour(d2f);
title('d^2F(x,y)/d^2x and d^2F(x,y)/d^2x');
ylabel('$ y $','Interpreter','latex','fontsize',12);
xlabel('$ x $','Interpreter','latex','fontsize',12);
grid on
axis equal


%% Plot3 - Graph3D of f Funcion
x = -10:0.4:10;
y = x;
[X,Y] = meshgrid(x,y);

Z= (X.^3).*(exp((-(X.^2) - (Y.^4))));
figure(4)
title('3D plot of F(x,y)');
surf(X,Y,Z);
grid on
axis equal

figure(5)
title('3D plot of F(x,y) - IN X-Y-Z  ');
surf(X,Y,Z);
grid on

figure(10)
subplot(2,2,1); mesh(X); title('X');
subplot(2,2,2); mesh(Y); title('Y');
subplot(2,2,3); mesh(X,Y); title('X,Y');
subplot(2,2,4); mesh(X,Y,Z); title('X,Y,Z');



fun = @(x)(x(1)^3)*(exp(-(x(1)^2) - (x(2)^4)));
x0 = [0.2,0.2];
x = fminsearch(fun,x0)
fun(x)
