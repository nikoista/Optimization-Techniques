clc;
clear;

%% Function initialize f
syms x1 x2;

f=(1/2)*(x1).^2 + (1/2)*(x2).^2;

disp("f =");pretty(f)

%% Plot-Graph of f Function.

figure(1)
fhandle = fcontour(f);
title('f(x1,x2)');
ylabel('$ x2 $','Interpreter','latex','fontsize',12);
xlabel('$ x1 $','Interpreter','latex','fontsize',12);
grid on
axis equal

%% 1 - Derivatives of f Function for x1 and for x2.

dfx1=diff(f,'x1');
dfx2=diff(f,'x2');
df=[dfx1,dfx2];
disp("Gradient of f(x1,x2) =");pretty(df)


%% Plot-Graph 1 - Derivatives of f .
figure(2)
dfxhandle = fcontour(df);
title('df(x1,x2)/dx1 and df(x1,x2)/dx2');
ylabel('$ x2 $','Interpreter','latex','fontsize',12);
xlabel('$ x1 $','Interpreter','latex','fontsize',12);
grid on
axis equal


%% 2 - Derivatives of f Function for x1 and for x2.
d2fx1=diff(df,'x1');
d2fx2=diff(df,'x2');
d2f=[d2fx1;d2fx2];
disp("Second Gradient of f(x1,x2) =");pretty(d2f)


%% Plot3 - Graph3D of f Funcion
x = -10:0.5:10;
y = x;
[X1,X2] = meshgrid(x,y);
Z= (1/2).*(X1).^2 + (1/2).*(X2).^2;


figure(4)
title('3D plot of f(x1,x2)');
surf(X1,X2,Z);
grid on

figure(10)
subplot(2,2,1); mesh(X1); title('X');
subplot(2,2,2); mesh(X2); title('Y');
subplot(2,2,3); mesh(X1,X2); title('X,Y');
subplot(2,2,4); mesh(X1,X2,Z); title('X,Y,Z');