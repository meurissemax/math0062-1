fileName = 'MFC';

[MFC, dim] = readFile(fileName);

breakProb = 1 - MFC(1,1,1); % probability of a failure of the production line

clearvars -except breakProb MFC
