%% TEXNIKES BELTISTOPOIHSHS 2020-2021 PROJECT
%% NIKOLAOS ISTATIADIS  AEM:9175

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% MULTIPLE GENERATION 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    FUNCTION
function [istoriko] = multiple_Generation_PID(number_Of_Generation,var_Bounds,...
                                              population_Size, best_sample, ...
                                            lucky_ones, number_of_child, Pr_mutation)
%% DHMIOURGIA ARXIKOU PLHTHYSMO
istoriko =  population_Initialize_PID(population_Size,var_Bounds);

%% DHMIOURGIA EPOMENOU GENERATION(PLHTHYSMO)
for i=1:1:number_Of_Generation
    i
    istoriko = next_Generation_PID(istoriko, var_Bounds, best_sample,....
                                 lucky_ones, number_of_child, Pr_mutation);
end

end