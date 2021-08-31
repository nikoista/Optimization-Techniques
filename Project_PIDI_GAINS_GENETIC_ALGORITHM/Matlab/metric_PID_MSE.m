%% TEXNIKES BELTISTOPOIHSHS 2020-2021 PROJECT
%% NIKOLAOS ISTATIADIS  AEM:9175

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% PID CONTROLLER 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% MEAN_SQUARED_ERROR
function [J7] = metric_PID_MSE(popul)

%% ANTISTOIXIZW TA KERDH KATHE ELEGKTH
kp1 = popul(1);
kp2 = popul(2);

ki1 = popul(3);
ki2 = popul(4);

kd1 = popul(5);
kd2 = popul(6);

% TELIKOS XRONOS tf
tf=0:0.1:50;

% EPITHHMITH EXODO yd,i ME i=1,2
yd_1 =@(t) (90*pi)/180 + (30*pi)*cos(t)/180;
yd_2 =@(t) (90*pi)/180 + (30*pi)*sin(t)/180;

% SUNARTHSH POU MAS DINETAI GIA UPOLOGISMO TWN SHMATWN
[x , t , u] = simclosedloop(kp1,kp2,ki1,ki2,kd1,kd2,tf(end));
e = [x(:,1) - yd_1(t) , x(:,3) - yd_2(t)];

%% MESH TIMH TETRAGWNIKOU SFALMATOS
error_Squared = e.^2;
MSE= error_Squared ./ max(size(e));

J7 = MSE;

end
