%% TEXNIKES BELTISTOPOIHSHS 2020-2021 PROJECT
%% NIKOLAOS ISTATIADIS  AEM:9175

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% FITNESS FUNCTION
function [fitness] = fitness_PID(kp1,kp2,ki1,ki2,kd1,kd2)
%% PRODIAGRAFES SUSTHMATOS KLEISTOU BROXOU

%% GIA TO SUSTHMA

% SFALMA PARAKOLOUTHHSHS EXODOU STO STEADY STATE TO POLU pi/180[rad]
Option1 = pi/180;

% UPERUPSWSH STA SFALMA PARAKOLOUTHHSHS EXODOU TO POLU pi/180[rad]
Option2 = pi/180;

% XRONOS APOKATASTASHS TWN SFALMATWN PARAKOLOUTHHSHS EXODOU STH ZWNH 
%            [-pi/180 , pi/180] TO POLU 1[s]
Option3 = 1;

%% EISODOS ELEXOU

% EISODO ELEGXOU POU H STIGMIAIA THS TIMH EINAI KATA TO DUNATO MIKROTERH
% KAI SE KATHE PERIPTWSH OXI MEGALUTERH APO 18[V]
Option4 = 17.9999;

% EISODO ELEGXOU POU H STIGMIAIA THS METABOLH EINAI KATA TO DUNATO MIKROTERH
% KAI SE KATHE PERIPTWSH OXI MEGALUTERH APO 160[V/s]
Option5 = 159.9999;

% EISODO ELEGXOU POU H SUNOLIKH THS METABOLH EINAI KATA TO DUNATO MIKROTERH
Option6 = 20;

%% TELIKOS XRONOS tf
tf=0:0.1:30;

% EPITHHMITH EXODO yd,i ME i=1,2
yd_1 =@(t) (90*pi)/180 + (30*pi)*cos(t)/180;
yd_2 =@(t) (90*pi)/180 + (30*pi)*sin(t)/180;

% SUNARTHSH POU MAS DINETAI GIA UPOLOGISMO TWN SHMATWN
[x , t , u] = simclosedloop(kp1,kp2,ki1,ki2,kd1,kd2,tf(end));
e = [x(:,1) - yd_1(t) , x(:,3) - yd_2(t)];

%% DEIKTES J1,...J6

ss = 0.9*(size(tf,2)-1);
[~,I1] = find(max(e(:,1)));
[~,I2] = find(max(e(:,1)));
t1=0.1*I1+0.5;
t2=0.1*I2+0.5;

J1(1,1) = (abs(e(ss,1)));
J1(1,2) = (abs(e(ss,2)));
J2(1,1) = max(abs(overshoot(e(:,1)))/100);
J2(1,2) = max(abs(overshoot(e(:,2)))/100);
J3(1,1) = t1;
J3(1,2) = t2;
J4 = max(abs(u));
J5 = max(abs(gradient(u)));
J6(1,1) = max(max(u(:,1)) - min(u(:,1)));
J6(1,2) = max(max(u(:,2)) - min(u(:,2)));

%% DIKOS MOU DEIKTHS MSE
flag=0;
c = 0;
epsilon = 0.00001;

population =[ kp1 ; kp2 ; ki1 ; ki2 ; kd1 ; kd2];
J7 = metric_PID_MSE(population);
for i=1:1:size(J7,1)
    if(J7(i,1) <= epsilon && J7(i,2) <= epsilon )
        flag=flag+1;
    end
end

%% AXIOLOGHSH ME VASH THN PARATHRHSH STHN EKFWNHSH

if(J1(1,1) <= Option1 && J1(1,2) <= Option1)
    c = c + 1 ;
end
if(J2(1,1) <= Option2 && J2(1,2) <= Option2)
    c = c + 1 ;
end
if(J3(1,1) <= Option3 && J3(1,2) <= Option3)
    c = c + 1 ;
end
if(J4(1,1) <= Option4 && J4(1,2) <= Option4)
    c = c + 1 ;
end
if(J5(1,1) <= Option5 && J5(1,2) <= Option5)
    c = c + 1 ;
end
if(J6(1,1) <= Option6 && J6(1,2) <= Option6)
    c = c + 1 ;
end
if ( flag >= size(J7,1)-3)
    c = c + 1 ;
end

if( c >= 6  )
    fitness = 0;
end
if(c == 5)
    fitness = 50;
end
if(c == 4)
    fitness = 60;
end
if(c == 3)
    fitness = 70;
end
if(c == 2)
    fitness = 80;
end
if(c == 1)
    fitness = 90;
end
if(c == 0)
    fitness = 100;
end

end

