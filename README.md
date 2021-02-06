# brain

tool used for visualization:
https://www.nitrc.org/project/list_screenshots.php?group_id=504&screenshot_id=710 

BrainNet Viewer, a graph-based brain network mapping tool, developed by Xia M, Wang J, He Y(2013)

Modified by Isha Kulkarni under guidance of Prof. Anand Joshi, University of Southern California

Steps to execute:
1)Open gray-ordinates/bci_gray_final_nodes.m in matlab. Provide absolute path to your surface file.
Currently, surface file used is: bci32ksurface.dfs
Run to create nodes.

2)open create_edges.m
provide absolute path of node file.
Run code to create edge file.

You can skip this step 1 & 2 if you already have surface, node and edge files ready.
Or you can go to folder gray-ordinates and use bci32ksurface.dfs as surface file and bciALLnodes.txt as node file to run Brainnet viewer.

3)Run brainnet/Brainnet.m
A window pops up.
Provide  your desired surface file path. (select dfs file format from drop down menu while selecting dfs file)
Provide node file path. (select (*.all files) as a file format from drop down menu while selecting node and edge files)
Provide edge file path if required.
Click next

In the next window
In the first tab, select layout (I mostly opt for a full view)
Go to nodes tab and select colormap= jet option if you want to see colourful nodes
Do to edges tab and select colormap= jet if you have color coded edges.
Click OK

