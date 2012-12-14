%% 
fid = fopen(['ReceptionRate.txt'],'r');
data = [];
while ~feof(fid)
    line = fgets(fid); %# read line by line
    data = [data sscanf(line,'%f')]; %# sscanf can read only numeric data :(
end
fclose(fid);
%%
[m, n] = size(data);
% 176
subplot(2,1,1);
hist(data(2,500:2500), 100)
xlabel('detected result');
ylabel('counts');
grid on;

axis([0 200 0 2000]);
subplot(2,1,2);
hist(data(3,500:2500), 100)
axis([0 200 0 2000]);
xlabel('detected result');
ylabel('counts');
grid on;