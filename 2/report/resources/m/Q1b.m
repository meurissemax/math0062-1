fileName = 'MFC';

[MFC, dim] = readFile(fileName);

nbrDim = length(dim);

jointProb = cell(1, nbrDim); % laws of joint probabilities

jointProb{1} = sum(MFC, 3); % (M,F)
jointProb{2} = reshape(sum(MFC, 2), [4, 5]); % (M,C)
jointProb{3} = reshape(sum(MFC, 1), [3, 5]); % (F,C)
