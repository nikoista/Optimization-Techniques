%% TEXNIKES BELTISTOPOIHSHS 2020-2021 PROJECT
%% NIKOLAOS ISTATIADIS  AEM:9175

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% MUTATION OF GAIN 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%      FUNCTION
function [mutated] = mutation_Gain_PID(Gain,bound)

idx = round(rand()*size(Gain,2));

if ( idx == 0)
    new_Gain = rand()*abs(bound);
else
    new_Gain = rand()*abs(bound)/3;
end

mutated = new_Gain;
end
