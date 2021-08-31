clc;
clear;


%% METHODOS FIBONACCI 

%% Functions initialize f1,f2,f3

euler=2.71828;

syms x;

f1= (x-2)^2 - sin(x+3);
f2=  euler^(-5*x) + (x+2)*(cos(0.5*x)*cos(0.5*x));
f3= (x^2)*sin(x+2) - (x+1)^2;

%% Choose a Function to begin calculations.

f=f1;

%f=f2;

%f=f3;



%%                                            a)

%Initialize l,A, B.

% A decent range is  0.002 < l < 0.01 from THEMA 1

l=abs(random('Normal',0.002,0.01));


A=2;
B=5;


%Initialize  first F0 , F1 , F2 FIBONACCI sequence.
F(1)=1;
F(2)=1;
F(3)=2;

N=3;

%Loop so that we find the right number N that makes our l > (1/F(N))*(B - A).
while((1/F(N))*(B - A)> l)
    
    for (i=1:1:N)
        %Formula of Fibonacci Numbers with combination of Xrusos Tomeas.
        F(i+1)=round(((1+sqrt(5))^(i+1) - (1-sqrt(5))^(i+1))/(2^(i+1)*sqrt(5)));
    end
    
    N=N+1;
end

%Now we find the perfect l=h .
h=(B-A)/F(N);

%We calculate the ranges for N to 1 with is the d1 = B-A range.
for (i=N:-1:1)
    d(i)=F(N-i+1)*h;
end

%Initialize a(1) , b(1) ,counters and i for the loop.
aa(1)=2;
bb(1)=5;

counter1=0;
counter2=0;

%Loop for the METHODOS FIBONACCI search algorithm.    
for(i=1:1:N-1)
  
    %Different from the book!
    x1(i) = bb(i) - F(N-i)*h;
    x2(i)=  aa(i) + F(N-i)*h;
    
    
    fx1(i) = subs(f,x1(i));
    fx2(i) = subs(f,x2(i));
    
    if( fx1(i) >  fx2(i))
        aa(i+1)=x1(i);
        bb(i+1)=bb(i);
        x1(i+1)=x2(i);
        x2(i+1)=x1(i) + (F(N-i+1)-F(N-i)) * h;
        
        counter2=counter2+1;
    end
    
    if( fx1(i) <  fx2(i))
        aa(i+1)=aa(i);
        bb(i+1)=x2(i);
        x2(i+1)=x1(i);
        x1(i+1)=x2(i) + (F(N-i+1)-F(N-i)) * h;
        
        counter1=counter1+1;
    end
    
    if(fx1(i) == fx2(i))
       break;
    end
    
     
    
end

figure(1)
plot(fx1,'blue','LineWidth',1.5);
title('f(x1) - i for l(t) and Epsilon = 0.001 ');
ylabel('$ f(x1)$','Interpreter','latex','fontsize',12);
xlabel('$ i $','Interpreter','latex','fontsize',12);
fprintf("\n");
fprintf("For l(t) and Epsilon = 0.001  \n");
fprintf(" Function f(x1) > f(x2) : %d Times \n",counter1);

figure(2)
plot(fx2,'blue','LineWidth',1.5);
title('f(x2) - i for l(t) and Epsilon = 0.001 ');
ylabel('$f(x2)$','Interpreter','latex','fontsize',12);
xlabel('$i$','Interpreter','latex','fontsize',12);
fprintf("For l(t) and Epsilon = 0.001  \n");
fprintf(" Function f(x1) < f(x2) : %d Times \n",counter2);



%%                                            b)
figure(3)
plot(aa,'black','LineWidth',2);
title('ak - k for l(t) and Epsilon = 0.001 ');
ylabel('$ ak $','Interpreter','latex','fontsize',12);
xlabel('$ k $','Interpreter','latex','fontsize',12);

figure(4)
plot(bb,'black','LineWidth',2);
title('b - k for l=(t) and Epsilon = 0.001 ');
ylabel('$bk$','Interpreter','latex','fontsize',12);
xlabel('$k$','Interpreter','latex','fontsize',12);

%Print the minimum x* and use the formula (a+b)/2 +- (b-a)/2 because the
%range difference is small.

x_min1=((aa(i) + bb(i))/ 2) + ((bb(i) - aa(i))/ 2);
x_min2=((aa(i) + bb(i))/ 2) - ((bb(i) - aa(i))/ 2);
fprintf("\n");
fprintf("The minimum of this function is : x* = [%d , %d]",x_min2,x_min1);
