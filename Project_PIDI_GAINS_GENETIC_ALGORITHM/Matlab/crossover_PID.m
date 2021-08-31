%% TEXNIKES BELTISTOPOIHSHS 2020-2021 PROJECT
%% NIKOLAOS ISTATIADIS  AEM:9175

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% CROSSOVER FUNCTION
function [crossover] = crossover_PID(individual1,individual2)

child = zeros(6,size(individual1,2));

%% EPILEGW TUXAIA ENA APO TA "CHILDREN" KAI KANW CROSSOVER 
for i=1:1:size(individual1,2)
    if ( round(rand()*100) < 50)
        child(:,i) = individual1(:,i);
    else
        child(:,i) = individual2(:,i);
    end
end

crossover = child;

end