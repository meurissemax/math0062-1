%% Function that calculates the output position of a ball
%
% ---------------------------------------- %
% Produced for project 1 (MATH0062-1) by Bastien Hoffmann and Maxime Meurisse
% Second year of Bachelor Civil Engineer - Academic Year 2017-2018
% ---------------------------------------- %
%
% This function takes inputs from the grid dimensions and the starting
% positions of the balls, and returns the output positions of the balls.
%
% This function works with half-positions to avoid considering the case of
% even and odd rows separately. A half-position corresponds to a position
% which lies between two starting positions. The output positions are rounded
% down to get an integer representing the correct output position.
%
% INPUTS
%   posInput: table containing the input positions
%   nbInputs: number of possible inputs on the grid
%   nbRows: number of rows of nails on the grid
%
% OUTPUT
%   posOutput: table containing the output positions associated with each input position of the posInput table

function posOutput = BallSimulation(posInput, nbInputs, nbRows)

%% Verification of the input parameters
if(nbInputs < 1 || nbRows < 1)
    error('The parameters of the function have invalid values or dimensions.');
end

%% Initialization
posOutput = posInput;

%% Calculation of the output position for each input
tmpSize = size(posInput, 2);

for i = 1:tmpSize
    posRand = randi([0 1], [1, nbRows]); % random movements generated for each row of nail
    
    for j = 1:nbRows
       if(posOutput(i) == 1) % case of extreme position
           tmpPos = 1/2;
       elseif(posOutput(i) == nbInputs) % case of extreme position
           tmpPos = -1/2;
       else
           tmpPos = posRand(j) - 1/2;
       end
       
       posOutput(i) = posOutput(i) + tmpPos;
    end
    
    posOutput(i) = floor(posOutput(i));
end