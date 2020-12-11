%Author: Isha Shrikant Kulkarni, University of Southern California 2020
% creating nodes according to surface file
dfsfile = readdfs('E:\_USC Courses\Brainsuite\_BrainNetViewer_20191031\Data\bci32kleft.dfs');
v = dfsfile.vertices;
f = dfsfile.faces;
labels = dfsfile.labels;
labelnames = unique(labels);

means_x = [];
means_y = [];
means_z = [];
node_size= [];
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
    node_size = [node_size, 4];
end

% node_colors=

nodehorz = [means_x; means_y; means_z];

nodes = nodehorz.';

writematrix(nodes,'bci32kleftnodes.txt','Delimiter',' ') 

% map= []
% for i=1:length(labelnames)
%     map=[map, i]
% end
% 
% writematrix(map,'mymap.txt','Delimiter',' ')