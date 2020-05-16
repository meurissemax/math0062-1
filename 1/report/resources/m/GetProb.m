%% Function that calculates the probability distribution of a simulated game
%
% ---------------------------------------- %
% Produced for project 1 (MATH0062-1) by Bastien Hoffmann and Maxime Meurisse
% Second year of Bachelor Civil Engineer - Academic Year 2017-2018
% ---------------------------------------- %
%
% This function takes the dimensions of the grid and the simulation vectors
% as inputs and returns the probability distribution of each output for each
% of the vectors.
%
% To obtain the probability that the ball falls into an output x, this
% function counts the number of outputs x in the vector and divides it by
% the number of elements in that vector.
%
% INPUTS
%   nbInputs: number of possible inputs on the grid
%   nbRows: number of rows of nails on the grid
%   outputs: cell containing the different simulation vectors
%
% OUTPUT
%   prob: cell containing the probability distribution of each simulation vector

function prob = GetProb(nbInputs, nbRows, outputs)

%% Definition of variables
nbVectors = size(outputs, 2);

prob = cell(1, nbVectors);

%% Verification of the input parameters
if(nbInputs < 1 || nbRows < 1 || nbVectors < 1)
    error('The parameters of the function have invalid values or dimensions.');
end

%% Initialization
if(mod(nbRows, 2) == 0)
    nbOutputs = nbInputs;
else
    nbOutputs = nbInputs - 1;
end

%% Calculation of the distribution of probability of the outputs
for i = 1:nbVectors
    prob{i} = zeros(nbOutputs, 1);
    
    for j = 1:nbOutputs
        prob{i}(j, 1) = (length(find(outputs{i}(1, :) == j))) / size(outputs{i}, 2);
    end
end

end