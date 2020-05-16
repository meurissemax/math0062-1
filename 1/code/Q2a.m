%% Script that simulates a game on a 4x3 grid and calculates the probability distribution
%
% ---------------------------------------- %
% Produced for project 1 (MATH0062-1) by Bastien Hoffmann and Maxime Meurisse
% Second year of Bachelor Civil Engineer - Academic Year 2017-2018
% ---------------------------------------- %

%% Clear workspace
clear

%% Definition of variables
nbInputs = 4; % number of inputs to the game
nbRows = 3; % number of rows of nails

posRandom = 0; % initial position of the ball (0 = random position)
posFixed = 1; % fixed initial position of the ball

vectors = 1e4; % size of each vector that will contain the simulations (example: 1e4 or [1e1; 1e2; 1e5])

%% Simulation of the game
outputsRandom = GameSimulation(nbInputs, nbRows, posRandom, vectors);
outputsFixed = GameSimulation(nbInputs, nbRows, posFixed, vectors);

%% Calculation of the probability distribution
probRandom = GetProb(nbInputs, nbRows, outputsRandom);
probFixed = GetProb(nbInputs, nbRows, outputsFixed);

%% Showing results
fprintf('Type "outputsRandom" to get the output positions for random initial positions.\n');
fprintf('Type "outputsFixed" to get the output positions for fixed initial positions.\n');
fprintf('Type "probRandom" to get the probability distribution for random initial positions.\n');
fprintf('Type "probFixed" to get the probability distribution for fixed initial positions.\n\n');

fprintf('Summary tables:\n');
show = table(probRandom{1}, probFixed{1});
show.Properties.VariableNames = {'probRandom', 'probFixed'};
disp(show);

%% Deleting unnecessary variables
clearvars vectors posFixed posRandom