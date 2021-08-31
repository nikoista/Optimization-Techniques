clc;
clear;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% EPILOGH  -1 GIA ARXIKOPOIHSH (-1,-1)
%% EPILOGH   0 GIA ARXIKOPOIHSH (0,0)
%% EPILOGH   1 GIA ARXIKOPOIHSH (1,1)
%% EPILOGH   7 GIA DIAFORETIKH ARXIKOIPOIHSH

choise=-1;
% choise=0;
% choise=1;
% choise=7;


%% ARITHMOS EPANALLHPSEWN KATHE ERWTHMATOS

Na=1;
Nb=1;
Nc=1;

%% METHODOS STEEPEST DECENT 
%% INITIALIZE FUNCTION f

syms x y;

f=(x.^3).*(exp(-(x.^2) - (y.^4)));

pretty(f)

%% 1 - DERIVATIVES OF FUNCTION F

dfx=diff(f,'x');
dfy=diff(f,'y');

pretty(dfx)
pretty(dfy)

grad_f=[dfx , dfy];

%% STATHERA TERMATISMOU epsilon

epsilon=0.0001;
eps=epsilon/0.1;





%%                                                            ERWTHMA    a)



%% ARXIKOPOIHSH SHMEIOU EKKINHSHS (x0,y0)    =    (0,0) , (1,1) , (-1,-1)
if(choise==7)
    x0=0.5;
    y0=0.5;
end

x0=choise;
y0=x0;

x=x0;
y=y0;
G=[x0,y0];

%% STEEPEST DECENT Dk=I MONADIAIOS
I=[1,0;0,1];
Dk=I;

%% INITIALIZE a, b GIA TA KRITHRIA KALHS LEITOURGIAS
b=0.99;
a=0.1;
o=0;


%% Gammak APO TON ALGORITHMO KLHSHS xk+1  = xk - gammakDkGrad(fk)

if(choise==-1)
    % GIA TO (-1,-1)
    gammak=0.4;
else
    % GIA TO (1,1) , (0,0)
    gammak=0.7;
end

%% LOOP STEEPEST DECENT METHODOS 
%% GIA GAMMAk = STATHERO 

k=1;
while(k<1000)
    
    k
    fprintf(" STEEPEST DECENT METHOD Gammak  IS A CONSTANT \n");
    
    FA(k)=double(subs(f));
    
    gradientFk=double(subs(grad_f));
    gradientFk=gradientFk';
    
   if ( norm((gradientFk)) < eps )
        x=G(1);
        y=G(2);
        PointA=vpa(G)
        STATHERO=vpa((subs(f)))
        break;
    end
    
    dk=-Dk*gradientFk;
    dk=dk';
    dkT=dk;
    
    fprintf("Gammak = %d \n",gammak);
    
    x=G(1);
    y=G(2);
    Fk=double(subs(f));
    
    G = G + gammak*dk;
    
    x=G(1);
    y=G(2);
    Fk_1=double(subs(f));
    gradientF_k_1 = double(subs(grad_f));
    
    if((Fk_1)<(Fk))
        o=1;
        if(dot(dkT,gradientFk) < 0 )
            o=2;
            if(dot(dkT,gradientF_k_1) > dot(b*dkT,gradientFk))
                o=3;
                if((Fk_1) <= (Fk + a*gammak*dkT*gradientFk))
                    o=4;
                else
                    break;
                end
            else
                break;
            end
        else
            break;
        end
    else
        break;
    end
    k=k+1;
    Na=Na+1;
end

if(o==4)
    fprintf("OLA TA KRITHRIA KALHS LEITOURGIAS PLHROUDE\n");
else
    fprintf("YPHRXE PROVLIMA ME TA a KAI b KAI gammak \n");
end


%%                                                            ERWTHMA    b)


%% ARXIKOPOIHSH SHMEIOU EKKINHSHS (x0,y0)    =    (0,0) , (1,1) , (-1,-1)

x=x0;
y=y0;
G=[x0,y0];

%% LOOP STEEPEST DECENT METHODOS 
%% GIA GAMMAk = min [f(xk-g*Dk*Grad(fk))]
k=1;
while(k<1000)
    
    k
    fprintf(" STEEPEST DECENT METHOD Gamma IS MINIMIZED BY THE FUNCTION f(xk+g*dk) \n");
    
    FB(k)=double(subs(f));
    
    gradientFk=double(subs(grad_f));
    gradientFk=gradientFk';
    
    if ( norm((gradientFk)) < eps )
        x=G(1);
        y=G(2);
        PointB=vpa(G)
        MinFun=vpa((subs(f)))
        break;
    end
    
    dk=-Dk*gradientFk;
    dk=dk';
    
    % df(xk+g*dk)/dg = 0
    gamma=@(g) ((G(1) + g*dk(1))^3)*(exp( - ((G(1) + g*dk(1))^2) - ((G(2) + g*dk(2)))^4));
    g = fminbnd (gamma,0.001,0.999);
    gammak=abs(g);
    fprintf("Gammak = %d \n",gammak);
    
    x=G(1);
    y=G(2);
    G = G + gammak*dk;
    
    k=k+1;
    Nb=Nb+1;
end





%%                                                            ERWTHMA    c)


%% ARXIKOPOIHSH SHMEIOU EKKINHSHS (x0,y0)    =    (0,0) , (1,1) , (-1,-1)

x=x0;
y=y0;
G=[x0,y0];

%% KANONAS ARMIJO alpha ,beta , s
alpha=0.001;
beta=0.99;
s=1;

%% LOOP STEEPEST DECENT METHODOS 
%% GIA GAMMAk POU IKANOPOIHEI TON KANONA TOU ARMIJO
%% Fk+1 <= Fk + a*(b^m)*s*Dk*Grad(fk)

k=1;
while(k<1000)
    
    k
    
    fprintf(" STEEPEST DECENT METHOD Gamma IS SELECTED  BY THE  ARMIJO LAW fk+1< = fk + a*(b^mk)*s*dkGrad(fk) \n");
    
    %INITIALIZE SE KATHE EPANALLHPSH me  m o epomenos akairaios mmax orio!
    m=1;
    mmax=20;
    
    while(m<mmax)
        
        G_next=G;
        
        gradientFk=double(subs(grad_f));
        gradientFk=gradientFk';
        
        dk=-Dk*gradientFk;
        dk=dk';
        
        x=G_next(1);
        y=G_next(2);
        Fk=double(subs(f));
        
        G_next=G_next + s*(beta^m)*dk;
        
        x=G_next(1);
        y=G_next(2);
        F_k_1=double(subs(f));
        
        
        if(F_k_1 <= Fk + alpha*(beta^m)*s*dk*(gradientFk))
            break;
        end
        m=m+1;
        
    end

    gammak=s*beta^m;
    fprintf("Gammak = %d \n",gammak);
    
    x=G(1);
    y=G(2);
    
    FC(k)=double(subs(f));
    
    gradientFk=double(subs(grad_f));
    gradientFk=gradientFk';
    
    if ( norm((gradientFk)) < eps )
        x=G(1);
        y=G(2);
        PointC=vpa(G)
        Armijo=vpa((subs(f)))
        break;
    end
    
    dk=-Dk*gradientFk;
    dk=dk';

    G = G + gammak*dk;
    
    k=k+1;
    Nc=Nc+1;
end

figure(1)
plot(FA,'black','LineWidth',2);
title('F - k for Gammak = Constant ');
ylabel('$ F $','Interpreter','latex','fontsize',12);
xlabel('$ k $','Interpreter','latex','fontsize',12);
grid on

figure(2)
plot(FB,'blue','LineWidth',2);
title('F - k for Gammak = Min ');
ylabel('$ F $','Interpreter','latex','fontsize',12);
xlabel('$ k $','Interpreter','latex','fontsize',12);
grid on

figure(3)
plot(FC,'red','LineWidth',2);
title('F - k for Gammak = Armijo ');
ylabel('$ F $','Interpreter','latex','fontsize',12);
xlabel('$ k $','Interpreter','latex','fontsize',12);
grid on

MINIMUM=[-1.2247  , 0.0001];

Distance=norm(MINIMUM-G)

