% creating nodes according to surface file
dfsfile = readdfs('E:\_softwares from2020\BrainNetViewer_20191031\Data\surface2523412leftmidcortexsvreg.dfs');
v = dfsfile.vertices;
f = dfsfile.faces;
labels = dfsfile.labels;
labelnames = unique(labels);

means_x = [];
means_y = [];
means_z = [];
for i =1: length(labelnames)
     x = [];
     y = [];
     z = [];
    for j=1:length(labels)
        if(labels(j) == labelnames(i))
            x = [x, v(j,1)];
            y = [y, v(j,2)];
            z = [z, v(j,3)];
    
        end
    end
    
    means_x = [means_x,mean(x)];
    means_y = [means_y,mean(y)];
    means_z = [means_z,mean(z)];
    
end

nodehorz = [means_x; means_y; means_z];
nodes = nodehorz.';

writematrix(nodes,'mynodes.txt','Delimiter',' ') 
