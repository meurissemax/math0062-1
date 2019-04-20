Q1b;

condProb = cell(1, nbrDim); % conditional probability laws

condProb{1} = bsxfun(@rdivide, permute(MFC, [2 3 1]), jointProb{3}); % (M|F,C)
condProb{2} = bsxfun(@rdivide, permute(MFC, [1 3 2]), jointProb{2}); % (F|M,C)
condProb{3} = bsxfun(@rdivide, permute(MFC, [2 1 3]), transpose(jointProb{1})); % (C|F,M)
