clear all
c = 299792458;
% % % 30um pure Euler bend (p=1) dispersion data
for i = 1:1:3
    
    data = [];
    omega0 = [];
    D1 = [];
    D2 = [];
    D3 = [];
    D4 = [];
    Frequency = [];
    mu = [];
    Dint = [];
    Dint2 = [];
    Dint3 = [];
    
    if i == 1
        data = load(['D81_04_F1_C3_auto002_pol1_laser1_calibData_disp.mat']);
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

        [val,idx]=min(abs(mu));
        offset = Dint(idx-40);

%         offset=min(Dint);

        limit_low = 1400;

        subplot(4,3,1);
        scatter(c./Frequency*1e-3,Dint-offset,20,'b');
        hold on
        plot(c./Frequency*1e-3,Dint_fit,'r','LineWidth',2);
        xlim([limit_low 1630]);
        xticks(limit_low:70:1630);

        xlabel('Wavelength (nm)');
        ylabel('$\frac{D_{int}}{2\pi}$ (GHz)','Interpreter','latex');
        legend('Data','Fit','Interpreter','latex');

        subplot(4,3,4);
        scatter(c./Frequency*1e-3,Dint2-offset,20,'b');
        hold on
        plot(c./Frequency*1e-3,Dint_fit_2,'r','LineWidth',2);
        xlim([limit_low 1630]);
        xticks(limit_low:70:1630);

        xlabel('Wavelength (nm)');
        ylabel('Deviation (GHz)');
        legend('Data','$(D_{int}-\frac{D_{2}}{2!}\cdot{\mu}^2)/2\pi$','Interpreter','latex');


        subplot(4,3,7);
        scatter(c./Frequency*1e-3,Dint3-offset,20,'b');
        hold on
        plot(c./Frequency*1e-3,Dint_fit_3,'r','LineWidth',2);
        xlabel('Wavelength (nm)');
        xlim([limit_low 1630]);
        xticks(limit_low:70:1630);
        ylabel('Deviation (GHz)');
        legend('Data','$(D_{int}-\frac{D_{2}}{2!}\cdot{\mu}^2-\frac{D_{3}}{3!}\cdot{\mu}^3)/2\pi$','Interpreter','latex');
% 
        subplot(4,3,10);
        h = histogram(transpose(abs(Dint3-offset-Dint_fit_3))*1e3,100);
        counts =  h.Values;
        % disp() % 31 for p=0.6
        xlim([0 1e3]);
        % xlim([0 0.5e2]);
        ylabel('occurrence');
        xlabel('Deviation (MHz)');
    end
    if i == 2
        data = load(['D81_04_F1_C3_auto003_pol1_laser1_calibData_disp.mat']);
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

        [val,idx]=min(abs(mu));
        offset = Dint(idx-20);

        % offset=min(Dint);

        limit_low = 1400

        subplot(4,3,2);
        scatter(c./Frequency*1e-3,Dint-offset,20,'b');
        hold on
        plot(c./Frequency*1e-3,Dint_fit,'r','LineWidth',2);
        xlim([limit_low 1630]);
        xticks(limit_low:70:1630);

        xlabel('Wavelength (nm)');
        ylabel('$\frac{D_{int}}{2\pi}$ (GHz)','Interpreter','latex');
        legend('Data','Fit','Interpreter','latex');

        subplot(4,3,5);
        scatter(c./Frequency*1e-3,Dint2-offset,20,'b');
        hold on
        plot(c./Frequency*1e-3,Dint_fit_2,'r','LineWidth',2);
        xlim([limit_low 1630]);
        xticks(limit_low:70:1630);

        xlabel('Wavelength (nm)');
        ylabel('Deviation (GHz)');
        legend('Data','$(D_{int}-\frac{D_{2}}{2!}\cdot{\mu}^2)/2\pi$','Interpreter','latex');


        subplot(4,3,8);
        scatter(c./Frequency*1e-3,Dint3-offset,20,'b');
        hold on
        plot(c./Frequency*1e-3,Dint_fit_3,'r','LineWidth',2);
        xlabel('Wavelength (nm)');
        xlim([limit_low 1630]);
        xticks(limit_low:70:1630);
        ylabel('Deviation (GHz)');
        legend('Data','$(D_{int}-\frac{D_{2}}{2!}\cdot{\mu}^2-\frac{D_{3}}{3!}\cdot{\mu}^3)/2\pi$','Interpreter','latex');
% 
        subplot(4,3,11);
        h = histogram(transpose(abs(Dint3-offset-Dint_fit_3))*1e3,100);
        counts =  h.Values;
        % disp() % 31 for p=0.6
        xlim([0 1e3]);
        % xlim([0 0.5e2]);
        ylabel('occurrence');
        xlabel('Deviation (MHz)');
    end
    
    if i == 3
        data = load(['D81_04_F1_C3_auto005_pol1_laser1_calibData_disp.mat']);
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

        [val,idx]=min(abs(mu));
        offset = Dint(idx-20);

        % offset=min(Dint);

        limit_low = 1400

        subplot(4,3,3);
        scatter(c./Frequency*1e-3,Dint-offset,20,'b');
        hold on
        plot(c./Frequency*1e-3,Dint_fit,'r','LineWidth',2);
        xlim([limit_low 1630]);
        xticks(limit_low:70:1630);

        xlabel('Wavelength (nm)');
        ylabel('$\frac{D_{int}}{2\pi}$ (GHz)','Interpreter','latex');
        legend('Data','Fit','Interpreter','latex');

        subplot(4,3,6);
        scatter(c./Frequency*1e-3,Dint2-offset,20,'b');
        hold on
        plot(c./Frequency*1e-3,Dint_fit_2,'r','LineWidth',2);
        xlim([limit_low 1630]);
        xticks(limit_low:70:1630);

        xlabel('Wavelength (nm)');
        ylabel('Deviation (GHz)');
        legend('Data','$(D_{int}-\frac{D_{2}}{2!}\cdot{\mu}^2)/2\pi$','Interpreter','latex');


        subplot(4,3,9);
        scatter(c./Frequency*1e-3,Dint3-offset,20,'b');
        hold on
        plot(c./Frequency*1e-3,Dint_fit_3,'r','LineWidth',2);
        xlabel('Wavelength (nm)');
        xlim([limit_low 1630]);
        xticks(limit_low:70:1630);
        ylabel('Deviation (GHz)');
        legend('Data','$(D_{int}-\frac{D_{2}}{2!}\cdot{\mu}^2-\frac{D_{3}}{3!}\cdot{\mu}^3)/2\pi$','Interpreter','latex');
% 
        subplot(4,3,12);
        h = histogram(transpose(abs(Dint3-offset-Dint_fit_3))*1e3,100);
        counts =  h.Values;
        % disp() % 31 for p=0.6
        xlim([0 1e3]);
        % xlim([0 0.5e2]);
        ylabel('occurrence');
        xlabel('Deviation (MHz)');
    end
% 
% 
% for i=1:1:100
%     if (abs(sum(counts(1:i))-0.9*sum(counts))<11);
%         disp(i)
%         disp(i*(h.BinEdges(2)-h.BinEdges(1)))
%     end
% end

% p=1: N.bin = 33, X_position = 25.6410
% p=0.6: N.bin = 31, X_position = 930
% p=0: N.bin = 31, X_position = 930
end

set(findall(gcf,'-property','FontSize'),'FontSize',15)
% savefig("Partial_Euler_dispersion.fig")
%for F5, p=1: N.bin = 32/40
% saveas(gcf,'Dispersion.pdf');c