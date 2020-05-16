fileName = 'MFC';

[MFC, dim] = readFile(fileName);

nbrDim = length(dim);

[espCost, etCost] = deal(cell(1, 3)); % expected value and standard deviation
bsCost = cell(2, 3); % upper bounds

espCost{1} = [0; 12000; 5000; 17000]; % M
espCost{2} = [0; 9000; 18000]; % F
espCost{3} = [0; 35000; 15000; 55000; 48000]; % C

etCost{1} = [0; 600; 300; 400]; % M
etCost{2} = [0; 150; 400]; % F
etCost{3} = [0; 500; 350; 1150; 1200]; % C

c = sqrt(20);

probBorne = 0.05;

%% Answer to question 4 - i
for i = 1:nbrDim
    bsCost{1, i} = espCost{i} + c*etCost{i}; % Inequality of Bienayme-Tchebyshev
end

%% Answer to question 4 - ii
for i = 1:nbrDim
    bsCost{2, i} = norminv(1-probBorne, espCost{i}, etCost{i}); % Normal distribution
end

clearvars -except bsCost MFC
