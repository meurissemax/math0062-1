%% Function that simulates a game
%
% ---------------------------------------- %
% Produced for project 1 (MATH0062-1) by Bastien Hoffmann and Maxime Meurisse
% Second year of Bachelor Civil Engineer - Academic Year 2017-2018
% ---------------------------------------- %
%
% This function takes as input the dimensions of the grid, the initial
% position and the number of simulations to be performed by vectors.
% It returns a cell containing the different simulation vectors.
%
% This function generates an array of inputs, of size equal to the size of
% the vector, and calls the function "BallSimulation" with this table of
% inputs in parameters. The operation is repeated for each vector.
%
% INPUTS
%   nbInputs: number of possible inputs on the grid
%   nbRows: number of rows of nails on the grid
%   posInit: choice of the starting position (0 = random position)
%   vectors: size of each vector that will contain the simulations
%
% OUTPUT
%   outputs: cell containing the different simulation vectors

function outputs = GameSimulation(nbInputs, nbRows, posInit, vectors)

%% Definition of variables
nbVectors = size(vectors, 1);

outputs = cell(1, nbVectors);

%% Verification of the input parameters
if(nbInputs < 1 || nbRows < 1 || posInit < 0 || posInit > nbInputs || nbVectors < 1)
    error('The parameters of the function have invalid values or dimensions.');
end

%% Calculation of the output positions for each vector
for i = 1:nbVectors
    tmpSize = vectors(i, 1);
    tmpPos = zeros(1, tmpSize);
    
    if(posInit == 0)
        tmpPos = randi([1 nbInputs], [1, tmpSize]);
    else
        tmpPos(1, :) = posInit;
    end
    
    outputs{i} = BallSimulation(tmpPos, nbInputs, nbRows);
end

end