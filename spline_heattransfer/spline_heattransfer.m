T = [11.1 11.1 11.7 13.9 20.6 22.8 22.8 22.8];
z = [27.2 22.9 18.3 13.7 9.1 4.9 2.3 0];

%% interpolating
zq = 0:1:28;
Tq = interp1(z, T, zq);

dTdz = gradient(Tq(:)) ./ gradient(zq(:));
d2Tdz2 = gradient(dTdz(:)) ./ gradient(zq(:));

for i = 1:29
    if (abs(dTdz(i)) == max(abs(dTdz)))
        hor = zq(i);
    end
end

%% temperature
subplot(1,3,1)
axis([0 30 0 30]);
xticks([0 10 20 30]);
yticks([0 10 20 30]);

plot(T,z,"o",'Color',[1 0 0]);
yline(hor,":");
title('(a) Temperature vs Depth');
xlabel('T (°C)');
ylabel('z (m)');
set(gca,'XAxisLocation','top','YAxisLocation','left')
axis(gca,'ij') 

%% gradient
subplot(1,3,2)
axis([-2.0 1.0 0 30]);
xticks([-2.0 -1.0 0.0 1.0]);
yticks([0 10 20 30]);

plot(dTdz,zq);
yline(hor,":");
title('(b) Gradient vs Depth');
xlabel('dT/dz');
set(gca,'XAxisLocation','top','YAxisLocation','left')
axis(gca,'ij')

%% second derivative
subplot(1,3,3)
axis([-0.5 0.5 0 30]);  
xticks([-0.5 0.0 0.5]);
yticks([0:5:30]);

plot(d2Tdz2,zq);
% pbaspect manual;
yline(hor,":");
title('(c) Second derivative vs Depth');
xlabel('d2T/dz2');
set(gca,'XAxisLocation','top','YAxisLocation','left')
axis(gca,'ij')