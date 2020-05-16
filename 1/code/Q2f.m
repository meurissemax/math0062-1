%% Script that simulates 1000 games on a 9x10 grid with the normal law and calculates the average and variance of expected values
%
% ---------------------------------------- %
% Produced for project 1 (MATH0062-1) by Bastien Hoffmann and Maxime Meurisse
% Second year of Bachelor Civil Engineer - Academic Year 2017-2018
% ---------------------------------------- %

%% Clear workspace
clear

%% Definition of variables
mu = 0; % expected value of the random variable Y
sigma = sqrt(2); % standard deviation of the random variable Y

vectors = [1e2; 1e3; 1e4; 1e5]; % size of each vector that will contain the simulations (example: 1e4 or [1e1; 1e2; 1e5])
nbVectors = size(vectors, 1);

nbExp = 1000; % number of times the experience is simulated

Z = cell(1, nbVectors);

allExpValue = zeros(nbVectors, nbExp); % table that contains the mathematical expectations of the 1000 experiments
avgExpValue = zeros(nbVectors, 1); % table that contains the average of the expected values
varExpValue = zeros(nbVectors, 1); % table that contains the average of the variances

%% Repetition of the experience
for i = 1:nbExp
    for j = 1:nbVectors
        tmpSize = vectors(j, 1);
        
        Z{j} = (normrnd(mu, sigma, tmpSize, 1))./(normrnd(mu, sigma, tmpSize, 1));
        
        allExpValue(j, i) = mean(Z{j});
    end
end

%% Calculation of the average and variance of expected values
for i = 1:nbVectors
   avgExpValue(i) = mean(allExpValue(i, :));
   varExpValue(i) = var(allExpValue(i, :), 1);
end

%% Showing results
fprintf('Type "avgExpValue" to get the average of expected values for each vector.\n');
fprintf('Type "varExpValue" to get the variance of expected values for each vector.\n\n');

fprintf('Summary tables:\n');
show = table(vectors, avgExpValue, varExpValue);
show.Properties.VariableNames = {'vectors', 'avgExpValue', 'varExpValue'};
disp(show);

%% Deleting unnecessary variables
clearvars allExpValue i j Z nbVectors vectors