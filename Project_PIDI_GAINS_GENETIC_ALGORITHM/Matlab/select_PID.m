%% TEXNIKES BELTISTOPOIHSHS 2020-2021 PROJECT
%% NIKOLAOS ISTATIADIS  AEM:9175

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% SELECTION FUNCTION
function [selected_Gen] = select_PID(population_Sorted , best_sample , lucky_ones)

nextGeneration1 = zeros(6,best_sample);
nextGeneration2 = zeros(6,lucky_ones);

%% KRATAW APO TON PLHTHYSMO TO KALUTERO DEIGMA POU EXW ORISEI STHN ARXH
for i=1:1:best_sample
    nextGeneration1(:,i) = population_Sorted(:,i);
end

%% KAI DHMIOURGW KAI ENA TUXAIRO DEIGMA POU EXW ORISEI STHN ARXH
for i=1:1:lucky_ones
    nextGeneration2(:,i) =  population_Sorted(:,i);
end

%% ENWNW TA DEIGMATA
selected_Gen = [ nextGeneration1 , nextGeneration2];

%% TELOS EPILEGW TUXAIA APO TO DEIGMA POU DHMIOURGISA 
selected_Gen = selected_Gen(:,randperm(length(selected_Gen)));

end
