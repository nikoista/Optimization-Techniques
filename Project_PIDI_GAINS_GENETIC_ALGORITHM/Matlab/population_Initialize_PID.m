%% TEXNIKES BELTISTOPOIHSHS 2020-2021 PROJECT
%% NIKOLAOS ISTATIADIS  AEM:9175

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% RANDOM ARXIKOPOIHSH 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% GENETIC ALGORITHMS
function [firstPopulation] = population_Initialize_PID(population_Size,var_Bound)%evaluation_Fnc,evaluation_Options,Options)

%% VECTOR GIA TA GAINS
kp1 = zeros(size(population_Size));
kp2 = zeros(size(population_Size));
ki1 = zeros(size(population_Size));
ki2 = zeros(size(population_Size));
kd1 = zeros(size(population_Size));
kd2 = zeros(size(population_Size));

%% RANDOM INITIALIZE THE GAINS
i = 1;
while (i <= population_Size)
    
    kp1(i) =  rand()*abs(var_Bound(1,1));
    
    kp2(i) =  rand()*abs(var_Bound(1,2));
    
    ki1(i) =  rand()*abs(var_Bound(2,1));

    ki2(i) =  rand()*abs(var_Bound(2,2));
    
    kd1(i) =  rand()*abs(var_Bound(3,1));
    
    kd2(i) =  rand()*abs(var_Bound(3,2));
    
    i=i+1;
end

%% PRWTOS PLHTHISMOS
firstPopulation = [kp1 ; kp2 ; ki1 ;ki2 ; kd1 ;kd2];
end
