clear;
load traintest;

for k = 1:length(trainPaths)
    trP = trainPaths{k};
    for m = 1:length(testPaths)
        teP = testPaths{m};
        if strcmp(trP,teP)
            warning('overlapping!!')
        else
            disp('checked')
        end
    end
end