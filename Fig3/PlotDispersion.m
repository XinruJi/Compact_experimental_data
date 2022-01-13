clear all
p = 1;
field = 3;

c = 299792458;

data = load(['D81_04_F' num2str(field) '_C3_30_' num2str(p) '_0.6_pol1_laser1_calibData_disp.mat']);

omega0 = data.D(1)/1e9;
D1 = data.D(2)/1e9;
D2 = data.D(3)/1e9;
D3 = data.D(4)/1e9;
D4 = data.D(5)/1e9;

K = transpose(data.res);

for i=1:1:length(K)
    mu(i) = K(i).mu;
    Dint(i) = K(i).dint/1e9;
    Dint2(i) = K(i).dint2/1e9;
    Dint3(i) = K(i).dint3/1e9;
%     Dint3(i) = (K(i).dint2-D3*1e9/6*K(i).mu^3)/1e9;
    Frequency(i) = K(i).freq/1e12;
    
end

Dint_fit = D2/2*mu.^2 + D3/6*mu.^3 + D4/24*mu.^4;
Dint_fit_2 = D3/6*mu.^3 + D4/24*mu.^4;
Dint_fit_3 = D4/24*mu.^4;

% finding position of mu0
if p==1  
    offset=min(Dint);
elseif p==0.6
    [val,idx]=min(abs(mu));
    offset = Dint(idx-20);
elseif p==0
    offset=min(Dint);
end

offset=min(Dint);

subplot(4,1,1);
scatter(c./Frequency*1e-3,Dint-offset,20,'b');
hold on
plot(c./Frequency*1e-3,Dint_fit,'r','LineWidth',2);
xlim([1350 1630]);
xticks(1350:70:1630);

xlabel('Wavelength (nm)');
ylabel('$\frac{D_{int}}{2\pi}$ (GHz)','Interpreter','latex');
legend('Data','Fit','Interpreter','latex');
ax = gca;
ax.FontSize = 15; 

subplot(4,1,2);
scatter(c./Frequency*1e-3,Dint2-offset,20,'b');
hold on
plot(c./Frequency*1e-3,Dint_fit_2,'r','LineWidth',2);
xlim([1350 1630]);
xticks(1350:70:1630);

xlabel('Wavelength (nm)');
ylabel('Deviation (GHz)');
legend('Data','$(D_{int}-\frac{D_{2}}{2!}\cdot{\mu}^2)/2\pi$','Interpreter','latex');
ax = gca;
ax.FontSize = 15; 


subplot(4,1,3);
scatter(c./Frequency*1e-3,Dint3-offset,20,'b');
hold on
plot(c./Frequency*1e-3,Dint_fit_3,'r','LineWidth',2);
xlabel('Wavelength (nm)');
xlim([1350 1630]);
xticks(1350:70:1630);
ylabel('Deviation (GHz)');
legend('Data','$(D_{int}-\frac{D_{2}}{2!}\cdot{\mu}^2-\frac{D_{3}}{3!}\cdot{\mu}^3)/2\pi$','Interpreter','latex');
ax = gca;
ax.FontSize = 15; 

subplot(4,1,4);
h = histogram(transpose(abs(Dint3-offset-Dint_fit_3))*1e3,100);
counts =  h.Values;
% disp() % 31 for p=0.6
xlim([0 1e2]);
xlim([0 1e2]);
ylabel('occurrence');
xlabel('Deviation (MHz)');
ax = gca;
ax.FontSize = 15; 

for i=1:1:100
    if (abs(sum(counts(1:i))-0.9*sum(counts))<20);
%         disp(i)
        disp(i*(h.BinEdges(2)-h.BinEdges(1)))
    end
end

% p=1: N.bin = 33, X_position = 25.6410
% p=0.6: N.bin = 31, X_position = 930
% p=0: N.bin = 31, X_position = 930

ax = gca;
ax.FontSize = 15; 

% savefig('Dispersion_F3.fig');