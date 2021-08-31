clc;
clear;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    THEMA 1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%% METHODOS MEGISTHS KATHODOU XWRIS PERIORISMOUS


%% EPILOGH   1  GIA ARXIKOPOIHSH  gamma = 0.1
%% EPILOGH   2 GIA ARXIKOPOIHSH   gamma = 1
%% EPILOGH   3 GIA ARXIKOPOIHSH   gamma = 2
%% EPILOGH   4 GIA DIAFORETIKH    gamma = 10

choise=4;
% choise=2;
% choise=3;
% choise=4;

%% METHODOS STEEPEST DECENT 
%% INITIALIZE FUNCTION f

syms x1 x2;

f=(1/2)*(x1).^2 + (1/2)*(x2).^2;

disp("f =");
pretty(f)

%% 1 - Derivatives of f Function for x1 and for x2.

dfx1=diff(f,'x1');
dfx2=diff(f,'x2');
grad_f=[dfx1,dfx2];

disp("Gradient of f(x1,x2) =");
pretty(grad_f)


%% Gammak APO TON ALGORITHMO KLHSHS xk+1  = xk - gammakDkGrad(fk)


if(choise ==1)
gammak=0.1;    %%    i)

elseif(choise ==2)
    
gammak=1;      %%    ii)
elseif(choise ==3)
    
gammak=2;      %%    iii)
elseif(choise ==4)
    
gammak=10;     %%    iv)
end

%% ARXIKOPOIHSH SHMEIOU EKKINHSHS (x0,y0)    =    OPOIODHPOTE

x0=10;
y0=1;

x1=x0;
x2=y0;
G=[x0,y0];

%% STEEPEST DECENT Dk=I MONADIAIOS
I=[1,0;0,1];
Dk=I;

%% INITIALIZE a, b GIA TA KRITHRIA KALHS LEITOURGIAS
b=0.99;
a=0.0001;
o=0;

%% STATHERA TERMATISMOU epsilon
eps=0.01;



%% LOOP STEEPEST DECENT METHODOS 
%% GIA GAMMAk = STATHERO 

k=1;
while(k<100)
    
    k
    X1(k)=x1;
    X2(k)=x2;
    fprintf(" STEEPEST DECENT METHOD Gammak  IS A CONSTANT \n");
    
    F(k)=double(subs(f));
    
    gradientFk=double(subs(grad_f));
    gradientFk=gradientFk';
    
   if ( norm((gradientFk)) < eps )
        x1=G(1);
        x2=G(2);
        TELEUTAIO_DIASTHMA=vpa(G)
        TELOS=vpa((subs(f)))
        break;
    end
    
    dk=-Dk*gradientFk;
    dk=dk';
    dkT=dk;
    
    fprintf("Gammak = %d \n",gammak);
    
    x1=G(1);
    x2=G(2);
    
    Fk=double(subs(f));
    
    G = G + gammak*dk;
    
    x1=G(1);
    x2=G(2);
    
    Fk_1=double(subs(f));
    gradientF_k_1 = double(subs(grad_f));
    
    %% KRITHRIA KALHS LEITOURGIAS
    if((Fk_1)<=(Fk))
        if(dot(dkT,gradientFk) < 0 )
            if(dot(dkT,gradientF_k_1) > dot(b*dkT,gradientFk))
                if((Fk_1) <= (Fk + a*gammak*dkT*gradientFk))
                    o=4;
                else
                    o=3;
                  %  break;   %% xtupaei to gk = 2
                end
            else
                o=3;
             %   break;
            end
        else
            o=2;
        %    break;
        end
    else
        o=1;
     %   break;    %% xtupaei to gk = 10
    end
    k=k+1;
end

if(o==4)
    fprintf("\n");
    fprintf("OLA TA KRITHRIA KALHS LEITOURGIAS PLHROUDE\n");
else
    fprintf("\n");
    fprintf("YPHRXE PROVLIMA ME TA a KAI b KAI gammak \n");
    x1=G(1);
    x2=G(2);
    TELEUTAIO_DIASTHMA=vpa(G)
    TELOS=vpa((subs(f)))
end

%% Plots GIA TO X1,X2,f SUNARTHSH TWN ARITHMO EPANALHPSEWN k

figure(1)
plot(double(X1),'blue');
title('X1 - k');
ylabel('$ X1 $','Interpreter','latex','fontsize',12);
xlabel('$ k $','Interpreter','latex','fontsize',12)
grid on
axis equal

figure(2)
plot(double(X2),'red');
title('X2 - k');
ylabel('$ X2 $','Interpreter','latex','fontsize',12);
xlabel('$ k $','Interpreter','latex','fontsize',12);
grid on
axis equal

figure(3)
plot(double(F),'black');
title('F - k');
ylabel('$ F $','Interpreter','latex','fontsize',12);
xlabel('$ k $','Interpreter','latex','fontsize',12);
grid on
axis equal
