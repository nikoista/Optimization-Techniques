clc;
clear;

%% METHODOS DIXOTOMOU


%% Functions initialize f1,f2,f3

euler=2.718;

syms x;

f1= (x-2)^2 - sin(x+3);
f2=  euler^(-5*x) + (x+2)*(cos(0.5*x)*cos(0.5*x));
f3= (x^2)*sin(x+2) - (x+1)^2;

%% Choose a Function to begin calculations.

f=f1;

%f=f2;


%f=f3;





%%                                            a)

%Initialize epsilon,l

% l > 2*epsilon to work, or the loop never ends!!

l=0.01;
epsilon=random('Normal',0.0001,(l/2)-0.0001);

%Initialize a(1) , b(1) ,counters and i for the loop.
a(1)=2;
b(1)=5;
counter1=0;
counter2=0;


i=1;
%Loop
while( b(i)- a(i) > l)
 
        x1(i)= (a(i)+b(i))/2 - epsilon;
        x2(i)= (a(i)+b(i))/2 + epsilon;
        
        fx1(i) = (subs(f,x1(i)));
        fx2(i) = (subs(f,x2(i)));
        
        if( fx1(i) <  fx2(i))
             a(i+1)=a(i);
             b(i+1)= x2(i);
             %fprintf("f(x1) < f(x2) \n");
             counter1=counter1+1;
        end
        if( fx1(i) >  fx2(i))
             a(i+1)=x1(i);
             b(i+1)= b(i);
             %fprintf("f(x1) > f(x2) \n");
             counter2=counter2+1;
        end
        if(fx1(i) == fx2(i))
            break;
        end
      
       
        i=i+1;
        epsilon=abs(random('Normal',0.001,0.01));
       
      
end

figure(1)
plot(fx1,'red','LineWidth',1.5);
title('f(x1) - i for l=0.01 and Epsilon(t) ');
ylabel('$ f(x1)$','Interpreter','latex','fontsize',12);
xlabel('$ i $','Interpreter','latex','fontsize',12);
fprintf("For l=0.01 and Epsilon(t) \n");
fprintf(" Function f(x1) > f(x2) : %d Times \n",counter1);



figure(2)
plot(fx2,'red','LineWidth',1.5);
title('f(x2) - i for l=0.01 and Epsilon(t) ');
ylabel('$f(x2)$','Interpreter','latex','fontsize',12);
xlabel('$i$','Interpreter','latex','fontsize',12);
fprintf("For l=0.01 and Epsilon(t) \n");
fprintf(" Function f(x1) < f(x2) : %d Times \n",counter2);

%%                                            b)
%Initialize epsilon,l.

% l > 2*epsilon to work, or the loop never ends!!
% A decent range is  2*epsilon < l < 0.01

epsilon=0.001;
l=abs(random('Normal',epsilon*2,0.01));

%l = 0.002;
%Initialize a(1) , b(1) ,counters and i for the loop.
aa(1)=2;
bb(1)=5;

counter1=0;
counter2=0;

%Loop for the METHODOS DIXOTOMOU search algorithm.
i=1;
while( bb(i)- aa(i) > l)
 
        x1(i)= (aa(i)+bb(i))/2 - epsilon;
        x2(i)= (aa(i)+bb(i))/2 + epsilon;
        
        fx1(i) = subs(f,x1(i));
        fx2(i) = subs(f,x2(i));
         
        if( fx1(i) <  fx2(i))
             aa(i+1)=aa(i);
             bb(i+1)= x2(i);
             
             counter1=counter1+1;
        end
        
        if( fx1(i) >  fx2(i))
             aa(i+1)=x1(i);
             bb(i+1)= bb(i);
             
             counter2=counter2+1;
        end
      
        i=i+1;

end

figure(3)
plot(fx1,'blue','LineWidth',1.5);
title('f(x1) - i for l(t) and Epsilon = 0.001 ');
ylabel('$ f(x1)$','Interpreter','latex','fontsize',12);
xlabel('$ i $','Interpreter','latex','fontsize',12);
fprintf("\n");
fprintf("For l(t) and Epsilon = 0.001  \n");
fprintf(" Function f(x1) > f(x2) : %d Times \n",counter1);

figure(4)
plot(fx2,'blue','LineWidth',1.5);
title('f(x2) - i for l(t) and Epsilon = 0.001 ');
ylabel('$f(x2)$','Interpreter','latex','fontsize',12);
xlabel('$i$','Interpreter','latex','fontsize',12);
fprintf("For l(t) and Epsilon = 0.001  \n");
fprintf(" Function f(x1) < f(x2) : %d Times \n",counter2);


%%                                            c)

figure(5)
plot(aa,'black','LineWidth',2);
title('ak - k for l(t) and Epsilon = 0.001 ');
ylabel('$ ak $','Interpreter','latex','fontsize',12);
xlabel('$ k $','Interpreter','latex','fontsize',12);

figure(6)
plot(bb,'black','LineWidth',2);
title('b - k for l=(t) and Epsilon = 0.001 ');
ylabel('$bk$','Interpreter','latex','fontsize',12);
xlabel('$k$','Interpreter','latex','fontsize',12);

%Print the minimum x* and use the formula (a+b)/2 +- (b-a)/2 because the
%range difference is small.

x_min1=((aa(i) + bb(i))/ 2) + ((bb(i) - aa(i))/ 2);
x_min2=((aa(i) + bb(i))/ 2) - ((bb(i) - aa(i))/ 2);
fprintf("\n");
fprintf("The minimum of this function is : x* = [%d , %d] \n",x_min2,x_min1);
fprintf("The range between them is : d = %d \n",x_min1-x_min2);