%% 
fid = fopen(['Blocking_in.txt'],'r');
data = [];
while ~feof(fid)
    line = fgets(fid); %# read line by line
    data = [data sscanf(line,'%f')]; %# sscanf can read only numeric data :(
end
fclose(fid);

data_mean_in= mean(data, 2);
% to calculate accuracy
% sum(data(end-1,:) == 176)/size(data, 2)

%% 
fid = fopen(['Blocking_out.txt'],'r');
data = [];
while ~feof(fid)
    line = fgets(fid); %# read line by line
    data = [data sscanf(line,'%f')]; %# sscanf can read only numeric data :(
end
fclose(fid);

data_mean_out = mean(data, 2);

%% 
plot(linspace(19.8, 21.23, 130), data_mean_in(2:end-2), '-b.',...
     linspace(19.8, 21.23, 130), data_mean_out(2:end-2), '-g.',...
     'LineWidth', 1);

legend(...
  'average signal inside the room',...
  'average signal outside of the room',...
  'Location','NorthEast'...
);
grid on;
xlabel('frequency'); ylabel('relative signal strength');


