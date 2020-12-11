%Author: Isha Shrikant Kulkarni, University of Southern California 2020
%creating nodes according to surface file
dfsfile = readdfs('E:\_USC Courses\Brainsuite\_BrainNetViewer_20191031\Data\bci32kleft.dfs');
v = dfsfile.vertices;
f = dfsfile.faces;
labelfile = load('BCI-DNI_brain_grayordinate_labels.mat');
labels = labelfile.labels(1:32000); %left
ind=find(labels==2000);
labels(ind,:)=[];
v(ind,:) =[];
labelnames = unique(labels);

means_x = [];
means_y = [];
means_z = [];
node_size= [];
node_colors=[];
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
    
    node_colors = [node_colors, i];
    node_size = [node_size, 3];
    
end

nodehorzleft = [means_x; means_y; means_z; node_colors; node_size];

nodesleft = nodehorzleft.';


% creating nodes according to surface file
dfsfile2 = readdfs('E:\_USC Courses\Brainsuite\_BrainNetViewer_20191031\Data\bci32kright.dfs');
v = dfsfile2.vertices;
f = dfsfile2.faces;

labels = labelfile.labels(32001:64000); %right
ind=find(labels==2000);
labels(ind,:)=[];
v(ind,:) =[];
labelnames = unique(labels);

means_x = [];
means_y = [];
means_z = [];
node_size= [];
node_colors=[];
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
    
    node_colors = [node_colors, i+34];
    node_size = [node_size, 3];
    
end

nodehorzright = [means_x; means_y; means_z; node_colors; node_size];

nodesright = nodehorzright.';


mnifile = load('gray-ordinates/bci_gord_vol_coord.mat');
labelfile = load('BCI-DNI_brain_grayordinate_labels.mat');
labels = labelfile.labels(64985 : 96854); 
ind=find(labels==2000);
labels(ind,:)=[];
labelnames = unique(labels);
v = mnifile.voxc(64985:96854,:).*[.8,.546875,0.546875];
v(ind,:) =[];

means_x = [];
means_y = [];
means_z = [];
node_size= [];
node_colors=[];
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
    
    node_colors = [node_colors, i+68];
    node_size = [node_size, 3];
    
end

nodehorzgray = [means_x; means_y; means_z; node_colors; node_size];

nodesgray = nodehorzgray.';

nodes = cat(1,nodesleft,nodesright,nodesgray);
writematrix(nodes,'gray-ordinates/bciALLnodes.txt','Delimiter',' ') ;
