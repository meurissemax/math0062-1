%% Function that calculates the expected value of a simulated game
%
% ---------------------------------------- %
% Produced for project 1 (MATH0062-1) by Bastien Hoffmann and Maxime Meurisse
% Second year of Bachelor Civil Engineer - Academic Year 2017-2018
% ---------------------------------------- %
%
% This function takes as input the vector of the outputs of a game and
% returns the expected value of this game.
%
% To obtain the expected value, this function creates a vector by associating
% with each output its gain, and then calculates the average of this vector.
%
% INPUT
%   outputs: cell containing the different simulation vectors
%
% OUTPUT
%   expValue: table containing the expected value of each simulation vector
%   outputsGains: cell containing the vectors built by associating with each output its gain

function [expValue, outputsGains] = GetExpValue(outputs)

%% Definition of variables
nbOutputs = size(outputs, 2);

outputsGains = cell(1, nbOutputs); % table containing the gain of each output
expValue = zeros(nbOutputs, 1);

gains = [1, -3, 5, -5, 8, -7, 7, -2, 1]; % table containing the winnings and losses of the game

%% Verification of the input parameters
if(nbOutputs < 1)
    error('The parameters of the function have invalid values or dimensions.');
end

%% Calculation of the expected value of a simulated game
for i = 1:nbOutputs
    tmpSize = size(outputs{i}, 2);
    
    % Creation of the vector containing the gains of each output
    for j = 1:tmpSize
        outputsGains{i}(1, j) = gains(1, outputs{i}(1, j));
    end
    
    expValue(i, 1) = mean(outputsGains{i});
end

end