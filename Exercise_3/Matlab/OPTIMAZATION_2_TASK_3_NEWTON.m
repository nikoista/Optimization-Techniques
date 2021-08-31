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

%% METHODOS NEWTON ME XRHSH PARAGWGOU
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

%% 2 - DERIVATIVES OF FUNCTION F

dfxx=diff(dfx,'x');
dfxy=diff(dfx,'y');
dfyx=diff(dfy,'x');
dfyy=diff(dfy,'y');

grad_2_f=[dfxx ,dfxy ; dfyx , dfyy];

%% STATHERA TERMATISMOU epsilon

epsilon=0.0001;
eps=epsilon/0.1;

%% INITIALIZE SHMEIO EKKINHSHS (x0,y0)    =    (0,0) , (1,1) , (-1,-1)

if(choise==7)
    x0=0.5;
    y0=0.5;
end

x0=choise;
y0=x0;

x=x0;
y=y0;
G=[x0,y0];



%% CHECK IF grad2(f) > 0 IF EVERY ELASONA ORIZOUSA > 0


gradient2Fk=double(subs(grad_2_f));
det1 = det(double(subs(grad_2_f(1))));
det2 = det(double(subs(grad_2_f)));

if( det1 > 0 && det2 > 0)
    fprintf(" grad^2(f) > 0 OPOTE EFARMOZW TON TUPO xk+1 = xk -gammak([grad^2(fk)]^-1)grad(fk)\n");
    flag=1;
elseif(det1==0 && det2 == 0)
    fprintf("DEN ORIZETE H ANTISTROFH DIOTI grad^2(f) = 0 OPOTE EFARMOZW TON grad^2(fk)(xk+1-xk)=-grad(fk) \n");
    flag=0;
else
    fprintf(" grad^2(f) < 0 KAI AKOLOUTHOUME TON ALGORITHMO LEVENBERG - MARQUARDT \n");
    flag=1;
end




%% Gammak APO TON ALGORITHMO KLHSHS xk+1  = xk - gammakDkGrad(fk)

if(choise==-1)
    % GIA TO (-1,-1)
    gammak=0.9;
else
    % GIA TO (1,1) , (0,0)
    gammak=0.4;
end


if (flag==1)
    
    
    
    %%                                                        ERWTHMA    a)


    
    
    %% INITIALIZE a, b GIA TA KRITHRIA KALHS LEITOURGIAS
    b=0.9;
    a=0.1;
    o=0;
    %% LOOP NEWTON METHOD
    %% GIA GAMMAk = STATHERO
    
    k=1;
    while(k<1000)
        
        k
        fprintf(" NEWTON METHOD Gammak  IS A CONSTANT \n");
        fprintf("Gammak = %d \n",gammak);
        
        FA(k) = double((subs(f)));
        
        gradientFk=double(subs(grad_f));
        gradientFk=gradientFk';
        
        if ( norm((gradientFk)) < eps )
            x=G(1);
            y=G(2);
            PointA=vpa(G)
            STATHERO=vpa((subs(f)))
            break;
        end
        
        gradient2Fk=double(subs(grad_2_f));
        
        dk=-double(inv(gradient2Fk)*(gradientFk));
        dk=dk';
        dkT=dk;
        
        x=G(1);
        y=G(2);
        Fk=double(subs(f));
        
        G = G + gammak*dk;
        
        x=G(1);
        y=G(2);
        Fk_1=double(subs(f));
        gradientF_k_1 = double(subs(grad_f));
        
        
        k=k+1;
        Na=Na+1;
        %% ???? ???? O HESSIAN PINAKAS EINAI > 0
%         
%         if((Fk_1)<=(Fk))
%             o=1;
%             if(dot(dkT,gradientFk) < 0 )
%                 o=2;
%                 if(dot(dkT,gradientF_k_1) > dot(b*dkT,gradientFk))
%                     o=3;
%                     if((Fk_1) <= (Fk + a*gammak*dkT*gradientFk))
%                         o=4;
%                     else
%                         break;
%                     end
%                 else
%                     break;
%                 end
%             else
%                 break;
%             end
%         else
%              break;
%         end
    end
    
    
if(o==4)
    %% ???? ???? O HESSIAN PINAKAS EINAI > 0
    fprintf("OLA TA KRITHRIA KALHS LEITOURGIAS PLHROUDE\n");
else
    fprintf("YPHRXE PROVLIMA ME TA a KAI b KAI gammak \n");
    x=x0;
    y=y0;
    PointA=vpa(G)
    STATHERO=vpa((subs(f)))
end
    
    
    
    
    
    
    %%                                                        ERWTHMA    b)


    %% INITIALIZE SHMEIO EKKINHSHS (x0,y0)    =   (1,1) , (-1,-1)
    
    x=x0;
    y=y0;
    G=[x0,y0];
    
    k=1;
    while(k<1000)
        
        k
        fprintf(" NEWTON METHOD Gamma IS MINIMIZED BY THE FUNCTION f(xk+g*dk) \n");
        
        FB(k) = double((subs(f)));
        
        gradientFk=double(subs(grad_f));
        gradientFk=gradientFk';
        
        if ( norm((gradientFk)) < eps )
            x=G(1);
            y=G(2);
            PointB=vpa(G)
            MinFun=vpa((subs(f)))
            break;
        end
        
        gradient2Fk=double(subs(grad_2_f));
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        dk=-double(inv(gradient2Fk)*(gradientFk));
        dk=dk';
        
        % df(xk+g*dk)/dg = 0
        gamma = @(g) ((G(1) + g*dk(1))^3)*(exp( - ((G(1) + g*dk(1))^2) - ((G(2) + g*dk(2)))^4));
        g = fminbnd (gamma,0.1,0.9999);
        gammak=abs(g);
        fprintf("Gammak = %d \n",gammak);
        
        G = G + gammak*dk;
        
        x=G(1);
        y=G(2);
        
        k=k+1;
        Nb=Nb+1;
    end
    
    
    
    
    
    
    
    %%                                                        ERWTHMA    c)


    %% INITIALIZE SHMEIO EKKINHSHS (x0,y0)    =   (1,1) , (-1,-1)
    
    x=x0;
    y=y0;
    G=[x0,y0];
    
    %% KANONAS ARMIJO alpha ,beta , s
    alpha=0.001;
    beta=0.99;
    s=1;
    
    %% LOOP NEWTON METHODOS
    %% GIA GAMMAk POU IKANOPOIHEI TON KANONA TOU ARMIJO
    %% Fk+1 <= Fk + a*(b^m)*s*Dk*Grad(fk)

    k=1;
    while(k<1000)
        
        k
        fprintf(" NEWTON METHOD Gamma IS SELECTED  BY THE  ARMIJO LAW fk+1< = fk + a*(b^mk)*s*dkGrad(fk) \n");
        
        m=1;
        mmax=20;
        
        
        while(m<mmax)
            
            G_next=G;
            
            gradientFk=double(subs(grad_f));
            gradientFk=gradientFk';
            
            gradientFkT=gradientFk';
            
            gradient2Fk=double(subs(grad_2_f));
            
            dk=-double(inv(gradient2Fk)*(gradientFk));
            dk=dk';
            
            x=G_next(1);
            y=G_next(2);
            Fk=double(subs(f));
            
            G_next=G_next + s*(beta^m)*dk;
            
            x=G_next(1);
            y=G_next(2);
            F_k_1=double(subs(f));
            
            
            if(F_k_1 <=Fk + alpha*(beta^m)*s*dk*(gradientFk))
                break;
            end
            
            m=m+1;
            
        end
        
        gammak=s*beta^m;
        fprintf("Gammak = %d \n",gammak);
        
        
        x=G(1);
        y=G(2);
        
        
        FC(k) = double((subs(f)));
        
        gradientFk=double(subs(grad_f));
        gradientFk=gradientFk';
        gradientFkT=gradientFk';
        
        if ( norm((gradientFk)) < eps )
            x=G(1);
            y=G(2);
            PointC=vpa(G)
            Armijo=vpa((subs(f)))
            break;
        end
        
        gradient2Fk=double(subs(grad_2_f));
        
        dk=-double(inv(gradient2Fk)*(gradientFk));
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
    
else
    
   
    %%                                          AN OMWS EIMAI STO (0,0) !!!
    
    x0=0;
    y0=x0;
    
    x=x0;
    y=y0;
    G=[x0,y0];
    
    k=1;
    while(k<1000)
        
        k
        fprintf(" NEWTON METHOD Gammak  IS A CONSTANT \n");
        fprintf("Gammak = %d \n",gammak);
        
        x=G(1);
        y=G(2);
        
        
        gradientFk=double(subs(grad_f));
        gradient2Fk= double(subs(grad_2_f));
        
        
        syms G1 G2
        G_new = [G1,G2];
        eqn = ((gradient2Fk).*(G_new - G)) == -gradientFk;
        [A,B] = equationsToMatrix([eqn], [G1 , G2])
        X = (linsolve(double(A),double(B)))
        
        if ( norm((gradientFk)) <= 0 )
            x=G(1);
            y=G(2);
            Point=vpa(G)
            MHDEN=vpa((subs(f)))
            break;
        end
        
        G = X;
        k=k+1;
    end
    
    
end


MINIMUM=[-1.2247  , 0.0001];

Distance= norm(MINIMUM-G)
