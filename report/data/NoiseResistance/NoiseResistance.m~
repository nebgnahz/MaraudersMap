%% 
fid = fopen(['talk.txt'],'r');
data = [];
while ~feof(fid)
    line = fgets(fid); %# read line by line
    data = [data sscanf(line,'%f')]; %# sscanf can read only numeric data :(
end
fclose(fid);

data_mean_in = mean(data, 2);
% to calculate accuracy
[sum(data(end-1,50:end-50) == 176)/(size(data, 2) - 99) ...
    sum(data(end,50:end-50) == 176)/(size(data, 2) - 99)]
% 0.9993  1

%% 
fid = fopen(['cough.txt'],'r');
data = [];
while ~feof(fid)
    line = fgets(fid); %# read line by line
    data = [data sscanf(line,'%f')]; %# sscanf can read only numeric data :(
end
fclose(fid);

data_mean_in = mean(data, 2);
% to calculate accuracy
[sum(data(end-1,50:end-50) == 176)/(size(data, 2) - 99) ...
    sum(data(end,50:end-50) == 176)/(size(data, 2) - 99)]
% 0.9725    1.0000

%% 
fid = fopen(['music.txt'],'r');
data = [];
while ~feof(fid)
    line = fgets(fid); %# read line by line
    data = [data sscanf(line,'%f')]; %# sscanf can read only numeric data :(
end
fclose(fid);

data_mean_in = mean(data, 2);
% to calculate accuracy
[sum(data(end-1,50:end-50) == 176)/(size(data, 2) - 99) ...
    sum(data(end,50:end-50) == 176)/(size(data, 2) - 99)]
% 0.9444    1.0000

%% 
fid = fopen(['clapping.txt'],'r');
data = [];
while ~feof(fid)
    line = fgets(fid); %# read line by line
    data = [data sscanf(line,'%f')]; %# sscanf can read only numeric data :(
end
fclose(fid);

data_mean_in = mean(data, 2);
% to calculate accuracy
[sum(data(end-1,50:end-50) == 176)/(size(data, 2) - 99) ...
    sum(data(end,50:end-50) == 176)/(size(data, 2) - 99)]
% 0.6917    0.7458

%% 
fid = fopen(['walking.txt'],'r');
data = [];
while ~feof(fid)
    line = fgets(fid); %# read line by line
    data = [data sscanf(line,'%f')]; %# sscanf can read only numeric data :(
end
fclose(fid);

data_mean_in = mean(data, 2);
% to calculate accuracy
[sum(data(end-1,50:end-50) == 176)/(size(data, 2) - 99) ...
    sum(data(end,50:end-50) == 176)/(size(data, 2) - 99)]
% 	