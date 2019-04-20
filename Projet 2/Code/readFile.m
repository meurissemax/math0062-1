% Function to read the matrix and to obtain its dimensions.

function [matrix, dim] = readFile(fileName)

file = load(strcat(fileName, '.mat'));
matrix = file.(fileName);

dim = size(matrix);

end
