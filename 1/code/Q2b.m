%% Script that simulates games on a 9x10 grid and calculates the expected values
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

vectors = [1e1; 1e2; 1e3; 1e4]; % size of each vector that will contain the simulations (example: 1e4 or [1e1; 1e2; 1e5])

%% Simulation of the game
outputs = GameSimulation(nbInputs, nbRows, posInit, vectors);

%% Calculation of the expected value
[expValue, outputsGains] = GetExpValue(outputs);

%% Showing results
fprintf('Type "outputs" to get the output positions for each vector.\n');
fprintf('Type "outputsGains" to get the gains for each vector.\n');
fprintf('Type "expValue" to get the expected value for each vector.\n\n');

fprintf('Summary tables:\n');
show = table(vectors, expValue);
show.Properties.VariableNames = {'vectors', 'expValue'};
disp(show);

%% Deleting unnecessary variables
clearvars posInit vectors