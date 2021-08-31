clc;
clear;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    THEMA 3
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% METHODOS MEGISTHS KATHODOU ME PERIORISMOUS

%% PERIORISMOI GIA TO X1 KAI X2
A1=[-20 , 10];
A2=[-12 , 15];

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


%% Gammak GIA TON ALGORITHMO MEGISTHS KATHODOU ME PROVOLH xk+1  = xk - gammakDkGrad(fk)
%gammak=0.05;   
gammak=0.3;
%% sk GIA TON ALGORITHMO MEGISTHS KATHODOU ME PROVOLH
%sk=20;
sk=5; 
%% ARXIKOPOIHSH SHMEIOU EKKINHSHS (x0,y0)    =    (-5 ,7)

x0=-5;
y0=7;

x1=x0;
x2=y0;
G=[x0,y0];

%% INITIALIZE a, b GIA TA KRITHRIA KALHS LEITOURGIAS
b=0.99;
a=0.1;
o=0;

%% STATHERA TERMATISMOU epsilon
eps=0.02;


%% LOOP STEEPEST DECENT METHODOS 
%% GIA GAMMAk = STATHERO 

k=1;
while(k<100)
    
    k
    X1(k)=x1;
    X2(k)=x2;
    xk = G;
    
    fprintf(" STEEPEST DECENT METHOD Gammak  IS A CONSTANT \n");
    
    F(k)=double(subs(f));
    
    gradientFk=double(subs(grad_f));
    gradientFk=gradientFk';
    gradientFkT=gradientFk;
    
   if ( norm((gradientFk)) < eps )
        x1=G(1);
        x2=G(2);
        TELEUTAIO_DIASTHMA=vpa(G)
        TELOS=vpa((subs(f)))
        break;
   end
    
   
    O = G - sk*(gradientFk');
    xk_bar = ProjX(A1,A2,O);
    
    
    fprintf("Gammak = %d \n",gammak);
    
    x1=G(1);
    x2=G(2);
    Fk=double(subs(f));
    
    G = G + gammak*(xk_bar - G);
    
    x1=G(1);
    x2=G(2);
    Fk_1=double(subs(f));
    gradientF_k_1 = double(subs(grad_f));
    
    %% KRITHRIA KALHS LEITOURGIAS
    if((Fk_1)<(Fk))
        if(dot(gradientFkT,(xk_bar - xk)) < 0 )
            if(dot(((xk_bar - xk)'),gradientF_k_1) > dot(b*((xk_bar - xk)'),gradientFk))
                if((Fk_1) <= (Fk + a*gammak*(xk_bar - xk)*gradientFkT))
                    o=4;
                else
                    o=3;
                   % break;
                end
            else
                o=3;
              %  break;
            end
        else
            o=2;
          %  break;
        end
    else
        o=1;
       % break;
    end
    k=k+1;
end

if(o==4)
    fprintf("OLA TA KRITHRIA KALHS LEITOURGIAS PLHROUDE\n");
else
    fprintf("YPHRXE PROVLIMA ME TA a KAI b KAI gammak \n");
    x1=G(1);
    x2=G(2);
    TELEUTAIO_DIASTHMA=vpa(G)
    TELOS=vpa((subs(f)))
end

%% Plots GIA TO X1,X2,f SUNARTHSH TWN ARITHMO EPANALHPSEWN k

figure(1)
plot(X1,'blue');
title('X1 - k');
ylabel('$ X1 $','Interpreter','latex','fontsize',12);
xlabel('$ k $','Interpreter','latex','fontsize',12)
grid on
axis equal

figure(2)
plot(X2,'red');
title('X2 - k');
ylabel('$ X2 $','Interpreter','latex','fontsize',12);
xlabel('$ k $','Interpreter','latex','fontsize',12);
grid on
axis equal

figure(3)
plot(F,'black');
title('F - k');
ylabel('$ F $','Interpreter','latex','fontsize',12);
xlabel('$ k $','Interpreter','latex','fontsize',12);
grid on
axis equal


%% Projection to X 

function [proj]=ProjX(X1,X2,O)

if(O(1) <= X1(1))
    proj(1) = X1(1);
elseif( X1(1)  <= O(1) && O(1) <= X1(2))
    proj(1) = O(1);
elseif(O(1) >= X1(2))
    proj(1) = X1(2);
end

if(O(2) <= X2(1))
    proj(2) = X2(1);
elseif( X2(1)  <= O(2) && O(2) <= X2(2))
    proj(2) = O(2);
elseif(O(2) >= X2(2))
    proj(2) = X2(2);
end


end