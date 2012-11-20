close all; clc;
% run data_out_1353289956673 first
surf(1:(size(data, 2)-1), 1:size(data, 1), data(:, 2:end));shading interp

[m, n] = size(data);
result = zeros(m, 7);
id = zeros(7,1);
    
for i=1:m
    % every frame; 
    % i.e. every time domain sample of entire frequency response
     
    % noise estimate from uninterested band
    % mutiply by 2 to tolerate error
    noise_ref = 2 * max(data(i, 2:10));
    
    % determine signal from the noise reference point
    % each signal band are treated separately, but index needs change in Java
    % select the MAX is because the FFT might drift frequency
%     result(i, 1) = max(data(i, 17:19)) > noise_ref;
%     result(i, 2) = max(data(i, 40:42)) > noise_ref;
%     result(i, 3) = max(data(i, 63:65)) > noise_ref;
%     result(i, 4) = max(data(i, 86:88)) > noise_ref;
%     result(i, 5) = max(data(i, 109:111)) > noise_ref;
%     
    
    result(i, 1) = max(data(i, 17:19)) > noise_ref;
    result(i, 2) = max(data(i, 29:31)) > noise_ref;
    result(i, 3) = max(data(i, 40:42)) > noise_ref;
    result(i, 4) = max(data(i, 52:54)) > noise_ref;
    result(i, 5) = max(data(i, 64:66)) > noise_ref;
    result(i, 6) = max(data(i, 79:81)) > noise_ref;
    result(i, 7) = max(data(i, 87:89)) > noise_ref/1.5;

    % run several (in this case, 20) times and determine
    if i>20
        for j = 1:7
            id(j) = sum(result(i-20:i, j));
        end
    end
    
    % due to the imperfect frequency response, we will assign different
    % weight to the id for detecting signals
    if (id(1) > 8 || id(2) > 8)
        % just print for debugging
        fprintf('Detected valid ID: ');
        for j = 1:7
            fprintf('%d ', id(j) > 3);
        end
        fprintf('\n');
    end
end