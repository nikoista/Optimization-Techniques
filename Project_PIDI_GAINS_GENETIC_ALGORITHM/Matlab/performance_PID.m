%% TEXNIKES BELTISTOPOIHSHS 2020-2021 PROJECT
%% NIKOLAOS ISTATIADIS  AEM:9175

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% PERFORMANCE FUNCTION
function [population_Sorted] = performance_PID(population_Size,population)

%% VECTOR ME TO PERFORMANCE TOU SUGEKRIMENOU PLHTHYSMO
population_Performance = zeros(1,population_Size);

%% UPOLOGIZW TO FITNESS
for i=1:1:population_Size
    population_Performance(i) = fitness_PID(population(1,i),population(2,i)...
        ,population(3,i),population(4,i),population(5,i),population(6,i));
end


%% TAXINOMO TON PLHTHYSMO ANALOGA ME TO PERFORMANCE SE AUXOUSA SEIRA
[~ ,I] = sort(population_Performance);
population_Sorted = population(:,I);

end

