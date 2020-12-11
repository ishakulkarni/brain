%Author: Isha Shrikant Kulkarni, University of Southern California 2020
%create edges connecing nodes
nodes = readmatrix('E:\_USC Courses\Brainsuite\_BrainNetViewer_20191031\bci32kleftnodes.txt');
n = size(nodes,1);
I = eye(n);
one = ones(n);
mat = one-I;
writematrix(mat,'bci32kleftedges.txt','Delimiter',' ');