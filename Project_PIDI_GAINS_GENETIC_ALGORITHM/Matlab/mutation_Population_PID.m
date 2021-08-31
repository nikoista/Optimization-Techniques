%% TEXNIKES BELTISTOPOIHSHS 2020-2021 PROJECT
%% NIKOLAOS ISTATIADIS  AEM:9175

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% MUTATION OF POPULATION 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%      FUNCTION
function [mutated_Population] = mutation_Population_PID(Pr_mutation,...
                                     population_Size,population,var_Bounds)

mut_kp1 = population(1,:);
mut_kp2 = population(2,:);
mut_ki1 = population(3,:);
mut_ki2 = population(4,:);
mut_kd1 = population(5,:);
mut_kd2 = population(6,:);



%% EPILEGW TUXAIA ENA APO TA GAINS KAI TO ALLAZW SUMFWNA ME THN DIADIKASIA
%% TOU MUTATION, ALLA EFARMOZODAS KAI TA APARAITHTA BOUNDS GIA KATHE KERDOS

for i=1:1:population_Size
    if (( rand() * 100) < Pr_mutation )
        mut_kp1(i) = mutation_Gain_PID(population(1,i),var_Bounds(1,1));
    end
    if (( rand() * 100) < Pr_mutation )
        mut_kp2(i) = mutation_Gain_PID(population(2,i),var_Bounds(1,2));
    end
    if (( rand() * 100) < Pr_mutation )
        mut_ki1(i) = mutation_Gain_PID(population(3,i),var_Bounds(2,1));
    end
    if (( rand() * 100) < Pr_mutation )
        mut_ki2(i) = mutation_Gain_PID(population(4,i),var_Bounds(2,2));
    end
    if (( rand() * 100) < Pr_mutation )
        mut_kd1(i) = mutation_Gain_PID(population(5,i),var_Bounds(3,1));
    end
    if (( rand() * 100) < Pr_mutation )
        mut_kd2(i) = mutation_Gain_PID(population(6,i),var_Bounds(3,2));
    end
end

mutated_Population = [mut_kp1 ; mut_kp2 ; mut_ki1 ; mut_ki2 ; mut_kd1 ;mut_kd2];


end