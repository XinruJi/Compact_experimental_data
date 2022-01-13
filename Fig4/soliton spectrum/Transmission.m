data = load('2021_08_19_T19.28.54_Dataset.mat');
T = data.handles.OSC1_data;
Transmission_x = T.x;
Transmission_y = T.tr.y;

figure
plot(Transmission_x,Transmission_y)
% xlabel('scanning time (ms)')
ylabel('Transmission')
xlim([8.4e-3 1.1e-2])
% savefig('Transmission.fig')
