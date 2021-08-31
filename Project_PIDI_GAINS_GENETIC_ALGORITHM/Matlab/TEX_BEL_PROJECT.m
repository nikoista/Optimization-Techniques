%% TEXNIKES BELTISTOPOIHSHS 2020-2021 PROJECT
%% NIKOLAOS ISTATIADIS  AEM:9175
clear;
clc;
close all;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% PID GAIN TUNNING WITH
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% GENETIC ALGORITHMS

%% SUXNOTHTA DEIGMATOLHPSIAS
T=10;
f=0.1;
tf = 0:f:30;

%% ARXIKOPOIHSH METABLHTWN KATASTASHS xi ME i=1,2,3,4
x0 = [ 110*pi/180 , 0 , 100*pi/180 0];
x0=x0';

%% EPITHHMITH EXODO yd,i ME i=1,2
yd_1 =@(t) (90*pi)/180 + (30*pi)*cos(t)/180;
yd_2 =@(t) (90*pi)/180 + (30*pi)*sin(t)/180;

%% ARXIKOPOIHSH SFALMATOS EXODOU
e0 = [x0(1) - yd_1(0) , x0(3) - yd_2(0)];


%% PRODIAGRAFES SUSTHMATOS KLEISTOU BROXOU

% GIA TO SUSTHMA
ess = pi/180;
Mp = pi/180;
ts = 1;

% EISODOS ELEXOU
u_now = 17.9999;
du_nowdt = 159.9999;
sum_dudt = 100;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ARXIKOPOIHSH VASIKWN METABLHTWN

% ARITHMOS KATHE PLHTHISMOU APO GAINS
size_population = 200 ;

% ARITHMOS TOU KALHTEROU DEIGMATOS APO TON SUNOLIKO PLHTHISMO
best_sample = 50;

% ARITHMOS TOU TUXAIROU DEIGMATOS APO TON SUNOLIKO PLHTHISMO
lucky_ones = 50;

% ARITHMOS TWN PAIDIWN 
numberOfChildren = 4;

% ARITHMOS TWN GENEIWN
numberOfGeneration = 100;

% PITHANOTHTA GIA METALAXH
propability_mutation = 0.01;

% FRRAGMATA GIA TIS TIMES TWN GAINS
var_Bounds = [100 100 ; 10 10 ; 100 100];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




%% GENETIC ALGORITHM 
[e,x,t,u,best] = genetic_AlgorithmPID(tf,size_population,best_sample...
                 ,lucky_ones,numberOfChildren,numberOfGeneration...
                 ,propability_mutation,var_Bounds);



%% PLOTS GIA TA STOIXEIA TOU SUSTHMATOS KLEISTOU BROXOU
kp1=best(1,1);
kp2=best(2,1);

ki1=best(3,1);
ki2=best(4,1);

kd1=best(5,1);
kd2=best(6,1);

kp1(1:10) = kp1;
kp2(1:10) = kp2;
ki1(1:10) = ki1;
ki2(1:10) = ki2;
kd1(1:10) = kd1;
kd2(1:10) = kd2;

%% EPITHHMHTES EXODOI
yd1= yd_1(t);
yd2= yd_2(t);

figure(1)
hold on;
ylabel('$e$','Interpreter','latex','fontsize',15)
xlabel('$t$','Interpreter','latex','fontsize',15)
name = strcat("Error --- t ");
title(name,'Interpreter','latex','fontsize',15)
plot(t,e,'LineWidth',1.5);
legend('Error 1','Error 2');
saveas(gcf,sprintf('%s.png', name));
hold off;

figure(2)
hold on;
ylabel('$x$','Interpreter','latex','fontsize',15)
xlabel('$t$','Interpreter','latex','fontsize',15)
name = strcat("x --- t ");
title(name,'Interpreter','latex','fontsize',15)
plot(t,x(:,1:4),'LineWidth',1.5);
legend('x1', 'x2','x3', 'x4');
saveas(gcf,sprintf('%s.png', name));
hold off;

figure(3)
hold on;
ylabel('$u$','Interpreter','latex','fontsize',15)
xlabel('$t$','Interpreter','latex','fontsize',15)
name = strcat("u --- t ");
title(name,'Interpreter','latex','fontsize',15)
plot(t,u,'LineWidth',1.5);
legend('u1', 'u2');
saveas(gcf,sprintf('%s.png', name));
hold off;

figure(4)
hold on;
a=1:10;
ylabel('$GAINS $','Interpreter','latex','fontsize',15);
xlabel('$t$','Interpreter','latex','fontsize',15);
name = strcat("GAINS --- t ");
title(name,'Interpreter','latex','fontsize',15);
plot(a,kp1,a,kp2,a,ki1,a,ki2,a,kd1,a,kd2);
legend('kp1', 'kp2','ki1', 'ki2','kd1', 'kd2','LineWidth',1.5);
hold off;
saveas(gcf,sprintf('%s.png', name));

figure(5)
hold on;
ylabel('$Yd,1 | x1 $','Interpreter','latex','fontsize',15);
xlabel('$t$','Interpreter','latex','fontsize',15);
name = strcat("Yd,1 --- x1 ");
title(name,'Interpreter','latex','fontsize',15);
plot(t,yd1,t,x(:,1),'--','LineWidth',1.5);
legend('Yd,1','x1');
hold off;
saveas(gcf,sprintf('%s.png', name));

figure(6)
hold on;
ylabel('$Yd,2 | x3 $','Interpreter','latex','fontsize',15);
xlabel('$t$','Interpreter','latex','fontsize',15);
name = strcat("Yd,2 --- x3 ");
title(name,'Interpreter','latex','fontsize',15);
plot(t,yd2,t,x(:,3),'--','LineWidth',1.5);
legend('Yd,2','x3');
hold off;
saveas(gcf,sprintf('%s.png', name));


%best=[83.9356164825275;99.3596101972446;0.444018377380164;6.20986160226141;31.3372046642079;20.1795503874363];
