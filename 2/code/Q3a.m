Q1a;
getCost;

[meanCost, varCost] = deal(cell(1, nbrDim)); % average costs and variances of these costs

for i = 1:nbrDim
    meanCost{i} = sum(cost{i}.*marginalProb{i});
    varCost{i} = var(cost{i}, marginalProb{i});
end

clearvars -except meanCost MFC varCost
