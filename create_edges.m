%create edges connecing nodes
nodes = readmatrix('E:\_USC Courses\Brainsuite\_BrainNetViewer_20191031\Data\mynodes.txt');
n = size(nodes,1);
I = eye(n);
one = ones(n);
mat = one-I;
writematrix(mat,'tempedges.txt','Delimiter',' ');