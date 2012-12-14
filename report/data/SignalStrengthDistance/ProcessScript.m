%% script to extract data and save it to cell
clear all; close all; clc;
data = {};
for i=1:15
    fid = fopen(['Distance2_' num2str(i) '0in.txt'],'r');
    data_i = [];
    while ~feof(fid)
        line = fgets(fid); %# read line by line
        data_i = [data_i sscanf(line,'%f')]; %# sscanf can read only numeric data :(
    end
    fclose(fid);
    data{i} = data_i;
end
save data.mat data
%% script to draw the result of the signal strength
% clear all; close all; clc;
load data;

signal1 = zeros(1, length(data));
signal2 = zeros(1, length(data));
signal3 = zeros(1, length(data));
signal4 = zeros(1, length(data));
noise = zeros(1, length(data));

% [17, 40, 64, 87]+1;
for i=1:length(data)
    samples = data{i};
    [m, n] = size(samples);
    for j=10:(n-10)
        signal1(i) = signal1(i) + max(samples([17 18 19], j))/(n-20);
        signal2(i) = signal2(i) + max(samples([40 41 42], j))/(n-20);
        signal3(i) = signal3(i) + max(samples([64 65 66], j))/(n-20);
        signal4(i) = signal4(i) + max(samples([87 88 89], j))/(n-20);
        noise(i) = mean(samples([2:10 25:35 48:58 71:81 95:131], j));
    end
end

%%
plot( ...
  20:20:150, signal1(2:2:end),'-kx',... 
  20:20:150, signal2(2:2:end),'-bv',...
  20:20:150, signal3(2:2:end),'-go',...
  20:20:150, signal4(2:2:end), '-r^',...
  20:20:150, noise(2:2:end), '-c+',...
  'LineWidth',2,...
  'MarkerSize',8);
legend(...
  '20kHz',...
  '20.25kHz',...
  '20.5kHz',...
  '20.75kHz',...
  'noise',...
  'Location','NorthEast'...
);
grid on;
xlabel('distance (inch)'); ylabel('relative signal strength');