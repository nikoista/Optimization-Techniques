% Function handlers f1,f2,f3
euler=2.71828;

f1=@(x) (x-2)^2 - sin(x+3);
f2=@(x) euler^(-5*x) + (x+2)*(cos(0.5*x)*cos(0.5*x));
f3=@(x) (x^2)*sin(x+2) - (x+1)^2;


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

%fplot(f2,[2,5]);
%fplot(f3,[2,5]);