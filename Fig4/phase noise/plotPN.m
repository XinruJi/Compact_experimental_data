clear all
close all
filesToAnalyzePN = dir(['*noise.mat']);
PNPoint = zeros(size(filesToAnalyzePN,1),1);
detuning= zeros(size(filesToAnalyzePN,1),1);
cfrequency = zeros(size(filesToAnalyzePN,1),1);
n = 0;
%plot PN
figure
for i = 1:size(filesToAnalyzePN,1)
    FileNamePN = filesToAnalyzePN(i).name;
    FileNamedet = [FileNamePN(1:end-15),'det.mat'];
    FileNamefreq = [FileNamePN(1:end-15),'freq.mat'];
    load(FileNamePN);
    load(FileNamedet);
    load(FileNamefreq);
    PNPoint(i) = Pn(1080);
    detuning(i) = cavity_loc;
    cfrequency(i) = cf;
    if mod(i,4) == 0
        semilogx(f,Pn,'DisplayName','1')
        hold on
    end
end
xlabel('Frequency (Hz)') 
ylabel('SSB phase noise (dbBc/Hz)') 
xlim([1e3 1e6])
%plot detuning vs phase noise & rep rate
figure
yyaxis left
plot(detuning*1e-6,PNPoint,'bo')
ylabel('SSB phase noise at 3.852 kHz offset (dBc/Hz)')
yyaxis right
plot(detuning*1e-6,(cfrequency-cfrequency(1))/1e3,'r*')
cfstr = ['Rep. rate - ',num2str(cfrequency(1)/1e9),' GHz (kHz)'];
ylabel(cfstr)
xlabel('Detuning (MHz)')

