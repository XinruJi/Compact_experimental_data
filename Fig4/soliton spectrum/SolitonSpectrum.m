data = load('2021_08_31_T22.45.53_Dataset.mat');

Spectrum = data.handles.OSA1_data;
Sepctrum_x = Spectrum.tr.x;
Sepctrum_y = Spectrum.tr.y;

figure
plot(Sepctrum_x,Sepctrum_y)
xlabel('wavelength (nm)')
ylabel('PSD (dBm)')
xlim([1520 1600])
ylim([-70 -20])

hold on
c = 3e5;
plot(Sepctrum_x,10*log10(abs(cosh(c./Sepctrum_x-192.42).^(-1.05)).^1.57)-44.3,linewidth=0.8)
legend('soliton spectrum','cosh fit')
% savefig('SolitonSpectrum2.fig')
