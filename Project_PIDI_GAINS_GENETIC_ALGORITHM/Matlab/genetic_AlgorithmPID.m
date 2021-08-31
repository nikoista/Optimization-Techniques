%% TEXNIKES BELTISTOPOIHSHS 2020-2021 PROJECT
%% NIKOLAOS ISTATIADIS  AEM:9175

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% GENETIKOS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% ALGORITHMOS MAIN

function [e,x,t,u,best] = genetic_AlgorithmPID(tf,size_population,best_sample,...
                                                lucky_ones,number_of_child,...
                                    number_of_generation,Pr_mutation,var_Bounds)

                                
%% ELENXW AN TO AN EXW VALEI SWSTA STOIXEIA 
if ((best_sample + lucky_ones) / 2 * number_of_child ~= size_population)
	fprintf("O ARITHMOS TOU PLHTHISMOU DEN EINAI EUSTATHHS \n");
else
	istoriko = multiple_Generation_PID(number_of_generation,var_Bounds,...
                                       size_population, best_sample, lucky_ones,...
                                       number_of_child, Pr_mutation);
end
	
%% BRHSKW TO KALUTERO VECTOR ME TA KERDOI TOU PID CONTROLLER
for i=1:1:size(istoriko,2)
		best_individuals(:,:,i) = performance_PID(size(istoriko,2), istoriko);
end

%% TA EXW TAXHNOMISH SE AUXOUSA SEIRA ME VASH TO PERFORMANCE OPOTE PERNW TO TELEUTAIO
best = best_individuals(:,:,end);

%%  UPOLOGIZW TA STOIXEIA TOU SUSTHMATOS KLEISTOU BROXOU

% EPITHHMITH EXODO yd,i ME i=1,2
yd_1 =@(t) (90*pi)/180 + (30*pi)*cos(t)/180;
yd_2 =@(t) (90*pi)/180 + (30*pi)*sin(t)/180;

for i=1:1:size(best,2)
    kp1=best(1,i);
    kp2=best(2,i);
    
    ki1=best(3,i);
    ki2=best(4,i);
    
    kd1=best(5,i);
    kd2=best(6,i);
    
    [x , t , u] = simclosedloop(kp1,kp2,ki1,ki2,kd1,kd2,tf(end));
    e = [x(:,1) - yd_1(t) , x(:,3) - yd_2(t)];
  
end
end