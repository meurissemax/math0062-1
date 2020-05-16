%% Script that simulates a game on a 9x10 grid for each input and calculates the expected value
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

vectors = 1e7; % size of each vector that will contain the simulations (example: 1e4 or [1e1; 1e2; 1e5])
nbVectors = size(vectors, 1);

expValueEachInput = zeros(nbInputs, 1); % table that contains the expected value of each input

%% Calculation of the expected value for each input
for j = 1:nbInputs
    % Simulation of the game
    outputs = GameSimulation(nbInputs, nbRows, j, vectors);
    
    % Calculation of the expected value
    [expValue, outputsGains] = GetExpValue(outputs);
    
    % Saving calculated expected value for an input
    expValueEachInput(j, :) = expValue(:, 1);
end

%% Showing results
fprintf('Type "expValueEachInput" to get the expected values for each input.\n\n');

fprintf('Summary tables:\n');
show = table([1; 2; 3; 4; 5; 6; 7; 8; 9], expValueEachInput);
show.Properties.VariableNames = {'inputs', 'expValueEachInput'};
disp(show);

%% Deleting unnecessary variables
clearvars expValue j nbVectors outputs outputsGains prob vectors