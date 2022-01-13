num=6;
data1 = load(['D81_04_F1_C3_auto00' num2str(num) '_pol1_laser1_calibData.mat']);
data2 = load(['D81_04_F1_C3_auto00' num2str(num) '_pol1_laser2_calibData.mat']);
c = 299792458;
x1=data1.data.xAxis;
y1=data1.data.trans;
x2=data2.data.xAxis+max(x1);
y2=data2.data.trans;

%---------------------------------- plot normalised
size1 = size(x1);
size2 = size(x2);

%normalise trace1 in 1000 points sample sets
k=0;
for i=1:1:size1(1)/1000
    max_interval1 = max(y1(k*1000+1:(k+1)*1000));
    for j=1:1:1000
        y1(k*1000+j)=y1(k*1000+j)/max_interval1;
    end
    k=k+1;
end

k=0;
for i=1:1:floor(size2(1)/1000)
    max_interval2 = max(y2(k*1000+1:(k+1)*1000));
    for j=1:1:1000
        y2(k*1000+j)=y2(k*1000+j)/max_interval2;
    end
    k=k+1;
end

plot(x1(1:end-1000)*1e-12,y1(1:end-1000),'Color','#0072BD')
hold on
plot(x2(1:end-1000)*1e-12,flip(y2(1:end-1000)),'Color','#D95319')
%----------------------------------

% xlim([183 222])
xlabel('Frequency (THz)','fontsize',15)
ylabel('Transmission (norm.)','fontsize',15)
% ylim([0 1])
ax = gca;
ax.FontSize = 15; 
pbaspect([5 1 1]);

% savefig("Transmission_0.8.fig")
% savefig("PartialEuler_Transmission.fig")
% savefig("Euler_Transmission.fig")