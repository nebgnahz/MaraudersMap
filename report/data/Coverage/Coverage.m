%% 
fid = fopen(['out_Thu Dec 13 20:42:05 PST 2012_southwest.txt'],'r');
data = [];
while ~feof(fid)
    line = fgets(fid); %# read line by line
    data = [data sscanf(line,'%f')]; %# sscanf can read only numeric data :(
end
fclose(fid);

data_mean_in = mean(data, 2);
% to calculate accuracy
[sum(data(end-1,50:end-50) == 170)/(size(data, 2) - 99) ...
    sum(data(end,50:end-50) == 170)/(size(data, 2) - 99)]
% 0.8336    0.9234

%% 
fid = fopen(['out_Thu Dec 13 20:43:33 PST 2012_south.txt'],'r');
data = [];
while ~feof(fid)
    line = fgets(fid); %# read line by line
    data = [data sscanf(line,'%f')]; %# sscanf can read only numeric data :(
end
fclose(fid);

data_mean_in = mean(data, 2);
% to calculate accuracy
[sum(data(end-1,50:end-50) == 170)/(size(data, 2) - 99) ...
    sum(data(end,50:end-50) == 170)/(size(data, 2) - 99)]
% 0.7908    0.8522

%% 
fid = fopen(['out_Thu Dec 13 20:45:14 PST 2012_southeast.txt'],'r');
data = [];
while ~feof(fid)
    line = fgets(fid); %# read line by line
    data = [data sscanf(line,'%f')]; %# sscanf can read only numeric data :(
end
fclose(fid);

data_mean_in = mean(data, 2);
% to calculate accuracy
[sum(data(end-1,50:end-50) == 170)/(size(data, 2) - 99) ...
    sum(data(end,50:end-50) == 170)/(size(data, 2) - 99)]
% 0.9975    1.0000


%% 
fid = fopen(['out_Thu Dec 13 20:54:33 PST 2012_east.txt'],'r');
data = [];
while ~feof(fid)
    line = fgets(fid); %# read line by line
    data = [data sscanf(line,'%f')]; %# sscanf can read only numeric data :(
end
fclose(fid);

data_mean_in = mean(data, 2);
% to calculate accuracy
[sum(data(end-1,50:end-50) == 170)/(size(data, 2) - 99) ...
    sum(data(end,50:end-50) == 170)/(size(data, 2) - 99)]
% 0.9951    1.0000

%% 
fid = fopen(['out_Thu Dec 13 20:56:31 PST 2012_northeast.txt'],'r');
data = [];
while ~feof(fid)
    line = fgets(fid); %# read line by line
    data = [data sscanf(line,'%f')]; %# sscanf can read only numeric data :(
end
fclose(fid);

data_mean_in = mean(data, 2);
% to calculate accuracy
[sum(data(end-1,50:end-50) == 170)/(size(data, 2) - 99) ...
    sum(data(end,50:end-50) == 170)/(size(data, 2) - 99)]
% 0.9827    1.0000

%% 
fid = fopen(['out_Thu Dec 13 20:58:36 PST 2012_north.txt'],'r');
data = [];
while ~feof(fid)
    line = fgets(fid); %# read line by line
    data = [data sscanf(line,'%f')]; %# sscanf can read only numeric data :(
end
fclose(fid);

data_mean_in = mean(data, 2);
% to calculate accuracy
[sum(data(end-1,50:end-50) == 170)/(size(data, 2) - 99) ...
    sum(data(end,50:end-50) == 170)/(size(data, 2) - 99)]
% 0.8979    0.9885

%% 
fid = fopen(['out_Thu Dec 13 21:00:05 PST 2012_northwest.txt'],'r');
data = [];
while ~feof(fid)
    line = fgets(fid); %# read line by line
    data = [data sscanf(line,'%f')]; %# sscanf can read only numeric data :(
end
fclose(fid);

data_mean_in = mean(data, 2);
% to calculate accuracy
[sum(data(end-1,50:end-50) == 170)/(size(data, 2) - 99) ...
    sum(data(end,50:end-50) == 170)/(size(data, 2) - 99)]
% 0.9700    1.0000

%% 
fid = fopen(['out_Thu Dec 13 21:01:42 PST 2012_west.txt'],'r');
data = [];
while ~feof(fid)
    line = fgets(fid); %# read line by line
    data = [data sscanf(line,'%f')]; %# sscanf can read only numeric data :(
end
fclose(fid);

data_mean_in = mean(data, 2);
% to calculate accuracy
[sum(data(end-1,50:end-50) == 170)/(size(data, 2) - 99) ...
    sum(data(end,50:end-50) == 170)/(size(data, 2) - 99)]
% 1     1


% southwest: 0.8336    0.9234
% south    : 0.7908    0.8522
% southeast: 0.9975    1.0000
% east     : 0.9951    1.0000
% northeast: 0.9827    1.0000
% north    : 0.8979    0.9885
% northwest: 0.9700    1.0000
% west     : 1     1
