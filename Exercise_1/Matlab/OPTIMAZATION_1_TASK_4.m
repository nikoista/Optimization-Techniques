clc;
clear;


%% METHODOS DIXOTOMOU ME XRHSH PARAGWGOU

%% Functions initialize f1,f2,f3

euler=2.71828;

syms x;

f1= (x-2)^2 - sin(x+3);
f2=  euler^(-5*x) + (x+2)*(cos(0.5*x)*cos(0.5*x));
f3= (x^2)*sin(x+2) - (x+1)^2;



%% Choose a Function to begin calculations.

%f=f1;
%f=f2;
f=f3;



%% 1 - Derivatives of f1,f2,f3 Functions

df=diff(f,'x');




%%                                            a)
%Initialize l.

% A decent range is  0.002 < l < 0.01 from THEMA 1
% which is typicaly l ~= 0

l=abs(random('Normal',0.002,0.01));


%Initialize a(1) , b(1) , dfdx ,counters and i for the loop.
aa(1)=2;
bb(1)=5;

dfdx = 1;

counter1=0;
counter2=0;

%Loop for the METHODOS DIXOTOMOU ME PARAGWGO search algorithm.    
i=1;
while(1)
 
        x(i)= (aa(i) + bb(i))/2;

        deriv_f(i) = subs(df,x(i));
        
        dfdx=deriv_f(i);
       
        if( 0 <  deriv_f(i))
             aa(i+1)=aa(i);
             bb(i+1)= x(i);
             
             counter1=counter1+1;
        end
        
        if( 0 >  deriv_f(i))
             aa(i+1)=x(i);
             bb(i+1)= bb(i);
             
             counter2=counter2+1;
        end
      
        %If df/dx = 0 and in our case a really small number l then break.
        if (abs(deriv_f(i)) <= l)
            break;
        end
        
        i=i+1;

end

figure(1)
plot( deriv_f,'blue','LineWidth',1.5);
title('df(x)/dx - i for l(t) and Epsilon = 0.001 ');
ylabel('$ df(x)/dx $','Interpreter','latex','fontsize',12);
xlabel('$ i $','Interpreter','latex','fontsize',12);
fprintf("\n");
fprintf("For l(t) and Epsilon = 0.001  \n");
fprintf(" deriv_f(x) > 0 : %d Times \n",counter1);
fprintf(" deriv_f(x) < 0  : %d Times \n",counter2);
%%                                            b)
figure(2)
plot(aa,'black','LineWidth',2);
title('ak - k for l(t) and Epsilon = 0.001 ');
ylabel('$ ak $','Interpreter','latex','fontsize',12);
xlabel('$ k $','Interpreter','latex','fontsize',12);

figure(3)
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