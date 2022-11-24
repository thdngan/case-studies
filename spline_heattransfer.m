T = [11.1 11.1 11.7 13.9 20.6 22.8 22.8 22.8];
z = [27.2 22.9 18.3 13.7 9.1 4.9 2.3 0];
% figure
% box on
% hold on
subplot(1,3,1)
axis([0 30 0 30]);
xticks([0 10 20 30]);
yticks([0 10 20 30]);

plot(T,z,"o");
set(gca,'XAxisLocation','top','YAxisLocation','left')
axis(gca,'ij') 

zq = 0:1:28;
Tq = interp1(z, T, zq);

dTdz = gradient(Tq(:)) ./ gradient(zq(:));
d2Tdz2 = gradient(dTdz(:)) ./ gradient(zq(:));
% 
% figure
% box on
% hold on
subplot(1,3,2)
axis([-2.0 1.0 0 30]);
xticks([-2.0 -1.0 0.0 1.0]);
yticks([0 10 20 30]);

plot(dTdz,zq);
set(gca,'XAxisLocation','top','YAxisLocation','left')
axis(gca,'ij')

% figure
% box on
% hold on

subplot(1,3,3)
axis([-0.5 0.5 0 30]);  
xticks([-0.5 0.0 0.5]);
yticks([0 10 20 30]);

plot(d2Tdz2,zq);
set(gca,'XAxisLocation','top','YAxisLocation','left')
axis(gca,'ij')