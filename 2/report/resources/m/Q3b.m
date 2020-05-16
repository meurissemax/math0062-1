fileName = 'MFC';

[MFC, dim] = readFile(fileName);

getCost;

[espPhi, varPhi] = deal(0); % expected value of the phi function and variance of the phi function

for i = 1:dim(1) % M
    for j = 1:dim(2) % F
        for k = 1:dim(3) % C
            espPhi = espPhi + (cost{1}(i) + cost{2}(j) + cost{3}(k))*MFC(i,j,k);
        end
    end
end

for i = 1:dim(1) % M
    for j = 1:dim(2) % F
        for k = 1:dim(3) % C
            varPhi = varPhi + ((cost{1}(i) + cost{2}(j) + cost{3}(k) - espPhi)^2)*MFC(i,j,k);
        end
    end
end

clearvars -except espPhi MFC varPhi
