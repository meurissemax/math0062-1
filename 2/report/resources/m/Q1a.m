fileName = 'MFC';

[MFC, dim] = readFile(fileName);

nbrDim = length(dim);

marginalProb = cell(1, nbrDim); % laws of marginal probabilities

marginalProb{1} = sum(sum(MFC, 2), 3); % M
marginalProb{2} = reshape(sum(sum(MFC, 1), 3), [3, 1]); % F
marginalProb{3} = reshape(sum(sum(MFC, 1), 2), [5, 1]); % C
