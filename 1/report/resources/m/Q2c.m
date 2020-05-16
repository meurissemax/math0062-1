%% Script that simulates 1000 games on a 9x10 grid and calculates the average and variance of expected values
%
% ---------------------------------------- %
% Produced for project 1 (MATH0062-1) by Bastien Hoffmann and Maxime Meurisse
% Second year of Bachelor Civil Engineer - Academic Year 2017-2018
% ---------------------------------------- %

%% Clear workspace
clear

%% Definition of variables
nbInputs = 9; % number of inputs to the game
nbRows = 10; % number of rows of nails

posInit = 0; % initial position of the ball (0 = random position)

vectors = [1e1; 1e2; 1e3; 1e4; 1e5]; % size of each vector that will contain the simulations (example: 1e4 or [1e1; 1e2; 1e5])
nbVectors = size(vectors, 1);

nbExp = 1000; % number of times the experience is simulated

allExpValue = zeros(nbVectors, nbExp); % table that contains the expected values of the 1000 experiments
avgExpValue = zeros(nbVectors, 1); % table that contains the average of the expected values
varExpValue = zeros(nbVectors, 1); % table that contains the average of the variances

%% Repetition of the experience
for i = 1:nbExp
    % Simulation of the game
    outputs = GameSimulation(nbInputs, nbRows, posInit, vectors);

    % Calculation of the expected value
    [expValue, outputsGains] = GetExpValue(outputs);
    
    % Saving calculated expected value
    allExpValue(:, i) = expValue(:, 1);
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
clearvars allExpValue expValue i nbVectors outputs outputsGains posInit prob vectors