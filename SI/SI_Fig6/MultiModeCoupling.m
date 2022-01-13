% clear all; close all; 
% addpath(genpath('.\functions'));
% addpath(genpath('..\utilities'));
% 
% 
cd('/Users/xinruji/Dropbox/Manuscript_Operating multi-mode photonic integrated circuits in the single-mode regime/02 Zenodo/SI/SI_Fig6')
filename = 'straight_MM_analysis.txt'; 
data = importComsolTable(filename);

c = 299792458;
% R = 30e-6;
% Lr = (2*pi*R + 3500*2)*1e-6;
L = 3500*1e-6;
freqs = data(:,1);%*1e12;
neff = data(:,2); 

fV = unique(freqs); 
neff00 = zeros(size(fV));
neff10 = zeros(size(fV));
neff20 = zeros(size(fV));

for iF = 1:length(fV) 
    validV = (freqs == fV(iF));
    if ~sum(validV) == 3
        disp('wrong number of modes');
        continue
    end 
    neff_sorted = real(sort(neff(validV),'ascend'));
    neff00(iF) = max(neff_sorted(3));
    neff10(iF) = max(neff_sorted(2));
    neff20(iF) = max(abs(neff_sorted(1)));
end

ng00 = calulate_group_index(fV,neff00);
ng10 = calulate_group_index(fV,neff10);
ng20 = calulate_group_index(fV,neff20);

deltaf10 = c./L./(ng10 - ng00);
deltaf20 = c./L./(ng20 - ng00);
colors = linspecer(3);

figure('Color','w'); 
ax(1) = subplot(2,1,1); hold on; box on; grid on;
xlabel('Frequency (THz)');
ylabel('Group index');
title('2200 nm x 900 nm');
set(gca,'XColor','k','YColor','k','Layer','top','XLim',[fV(2) fV(end-1)]/1e12);
plot(fV(2:end-1)/1e12,ng00(2:end-1),'color',colors(1,:),'linewidth',1.5);
plot(fV(2:end-1)/1e12,ng10(2:end-1),'color',colors(2,:),'linewidth',1.5);
plot(fV(2:end-1)/1e12,ng20(2:end-1),'color',colors(3,:),'linewidth',1.5);
ylim([2.06 2.33])

ax(2) = subplot(2,1,2); hold on; box on; grid on;
set(gca,'XColor','k','YColor','k','Layer','top','XLim',[fV(2) fV(end-1)]/1e12);
plot(fV(2:end-1)/1e12,deltaf10(2:end-1)/1e12,'color',colors(2,:),'linewidth',1.5)
plot(fV(2:end-1)/1e12,deltaf20(2:end-1)/1e12,'color',colors(3,:),'linewidth',1.5)
ylim([0.3 1.5])

xlabel('Frequency (THz)');
ylabel('Interference period (THz)');
legend('TE10-TE00','TE20-TE00','Location','Best','Orientation','Horizontal');
% saveas(gcf,'MultimodeInterference_900x2200.pdf')