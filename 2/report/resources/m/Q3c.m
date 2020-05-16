Q1a;
getCost;

[espCond, varCond] = deal(zeros(dim(1), 1)); % conditional expected value of phi and conditional variance of phi knowing M

%% Answer to question 3c - i
for i = 1:dim(1) % M
    for j = 1:dim(2) % F
        for k = 1:dim(3) % C
            espCond(i) = espCond(i) + (cost{1}(i) + cost{2}(j) + cost{3}(k))*(MFC(i,j,k)/marginalProb{1}(i));
        end
    end
    
    for j = 1:dim(2) % F
        for k = 1:dim(3) % C
            varCond(i) = varCond(i) + ((cost{1}(i) + cost{2}(j) + cost{3}(k) - espCond(i))^2)*(MFC(i,j,k)/marginalProb{1}(i));
        end
    end
end

%% Answer to question 3c - ii
% Theorem of total hope
espTot = sum(espCond.*marginalProb{1});

%% Answer to question 3c - iii
% Theorem of total variance
varTot = 0;

for i = 1:dim(1) % M
    varTot = varTot + ((espCond(i) - espTot)^2 + varCond(i))*marginalProb{1}(i);
end

clearvars -except espCond espTot MFC varCond varTot
