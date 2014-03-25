clear;

source = '../data/segmented_data';
Y = dir(source);


% parse all species and all paths
allSpecies = [];
allPaths = [];
for y = 3:length(Y) 
    if strcmp(Y(y).name,'2007') % ignore 2007 for now
        continue;
    end
    ypath = [source,'/',Y(y).name];
    
    S = dir(ypath);
    for s = 3:length(S)
        [pathstr,name,ext]=fileparts(S(s).name);
        if ~isempty(ext)
            continue;
        end
        currentSpecies = name(1:4);
        
        if name(5)~='_' && name(5)~='-'
        	warning(['invalid folder: ', S(s).name]);
        end        
        
        spath = [ypath,'/',S(s).name];
        F = dir(spath);
        
        for f = 3:length(F)
            [pathstr,name,ext]=fileparts(F(f).name);
            if ~strcmp(ext,'.wav')
                continue;
            end
%             if ~strcmp(name(1:3),'sel')
%                 warning(['file: ',F(f).name,' not starting with sel.']);
%             end
            allSpecies{end+1} = currentSpecies;
            fname = [spath,'/',F(f).name];
            allPaths{end+1} = fname;        
        end
    end
end

% get label species mapping
mapping = unique(allSpecies);

% get label from species
allLabels = zeros(size(allSpecies));
for k = 1:length(allLabels)
    sp = allSpecies{k};
    allLabels(k)=find(ismember(mapping,sp));
end

save allPathAndLabel allPaths allLabels allSpecies mapping;