
% Load the data from Excel
data = readtable('Readings_Experiment_Data.xlsx');

% Extract time and temperature readings
time = data{:, 1};        % Time (s)
T1 = data{:, 2};
T2 = data{:, 3};
T3 = data{:, 4};
T4 = data{:, 5};
T5 = data{:, 6};

% Shift time so that t = 890 s becomes the new zero
time_shifted = time - 890;

% Keep only data where shifted time >= 0
valid_idx = time_shifted >= 0;
time_shifted = time_shifted(valid_idx);
T1 = T1(valid_idx);
T2 = T2(valid_idx);
T3 = T3(valid_idx);
T4 = T4(valid_idx);
T5 = T5(valid_idx);

% Plot temperature vs time for T1 to T5
figure;
plot(time_shifted, T1, 'r', ...
     time_shifted, T2, 'g', ...
     time_shifted, T3, 'b', ...
     time_shifted, T4, 'm', ...
     time_shifted, T5, 'c');
xlabel('Time (s)');
ylabel('Temperature (°C)');
title('Temperature vs Time for Thermocouple Readings');
legend('T1', 'T2', 'T3', 'T4', 'T5');
grid on;
