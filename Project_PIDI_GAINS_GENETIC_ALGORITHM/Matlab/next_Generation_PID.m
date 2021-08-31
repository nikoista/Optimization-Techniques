%% TEXNIKES BELTISTOPOIHSHS 2020-2021 PROJECT
%% NIKOLAOS ISTATIADIS  AEM:9175

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% NEXT GENERATION 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    FUNCTION
function [next_Generation] = next_Generation_PID(firstPopulation,var_Bounds,...
                                               best_sample, lucky_ones,...
                                               number_of_child, Pr_mutation)

%% TAXINOMHSH PLHTHYSMO ANALOGA ME TO PERFORMANCE (FITNESS)
population_Sorted = performance_PID(size(firstPopulation,2),firstPopulation);

%% EPOMENH EPILEGMENH GENEIA GENEIA 
next_Breeders = select_PID(population_Sorted, best_sample, lucky_ones);

%% EFARMOZW THN DIADIKASIA TOU CROSSOVER STHN GENEIA 
next_Population = create_Children_PID(next_Breeders, number_of_child);

%% TELOS EFARMOZW THN DIADIKASIA TOU MUTATION STHN GENEIA
next_Generation = mutation_Population_PID(Pr_mutation,size(next_Population,2),next_Population,var_Bounds);

end