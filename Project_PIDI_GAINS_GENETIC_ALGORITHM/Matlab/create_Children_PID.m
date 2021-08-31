%% TEXNIKES BELTISTOPOIHSHS 2020-2021 PROJECT
%% NIKOLAOS ISTATIADIS  AEM:9175

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% CREATE CHILDREN FUNCTION
function [nextPopulation] = create_Children_PID(breeders,number_of_child)


%% DHMIOURGW THN IDIOTHTA TOU CROSSOVER STON NEO PLHTHYSMO
for i=1:1:(size(breeders,2))/2
    for j=1:1:number_of_child
        new_Population(:,i) = crossover_PID(breeders(:,i), breeders(:,size(breeders,2)-1-i));
    end
end

nextPopulation = new_Population;
end