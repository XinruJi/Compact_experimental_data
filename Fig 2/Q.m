clear all
data1 = load('D81_04_F2_C3_30_1_0.6_pol1_laser1_calibData_res.mat');
data2 = load('D81_04_F2_C3_30_0.6_0.6_pol1_laser1_calibData_res.mat');
data3 = load('D81_04_F2_C3_30_0_0.6_pol1_laser1_calibData_res.mat');

c = 299792458;
K = transpose(data2.res);

for i=1:1:length(K)
    kappa0(i) = K(i).kappa0/1e6;
    kappaEx(i) = K(i).kappaEx/1e6;
    kappaTotal(i) = K(i).kappa0/1e6 + K(i).kappaEx/1e6;
    Frequency(i) = K(i).freq/1e12;
end

subplot(2,1,1);
scatter(transpose(c./Frequency*1e-3),transpose(kappa0))
hold on
scatter(transpose(c./Frequency*1e-3),transpose(kappaTotal))
xlim([1340 1640])
ylim([0 180])
xlabel('Wavelength (nm)')

legend('Intrinsic linewidth \kappa_{0}/2\pi (MHz)','Total linewidth \kappa/2\pi (MHz)')

subplot(2,1,2);
nbins = 50;
edgebin = 0:120;
h = histogram(transpose(kappa0),'BinEdges',0:3:120);
xlim([0 120]);
ylim([0 120])

% savefig('Q_p_0.6.fig');
