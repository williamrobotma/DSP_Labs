%Question 1c
w = linspace(-pi,pi,501);
n = -30:1:30;

step1 = n >= 0;
step2 = n >= 51;
stepsum = step1-step2;
x1 = cos(0.5*pi.*n) + 1j * sin(0.5*pi.*n);
xa = x1.*stepsum;

ya = dtft(xa, n, w);
yabs = abs(ya);
yang = angle(ya);

figure(2)
subplot(211)
plot(w/pi, yabs,'LineWidth',1.5);
wtick = [-1:0.2:1];
magtick = [0:10:60];
xlabel('\omega/\pi');
ylabel('|X|');
title('Magnitude response');
set(gca,'XTick',wtick);
set(gca,'YTick',magtick);

subplot(212)
plot(w/pi, yang*180/pi,'LineWidth',1.5);
axis([-1,1,-200,200]);
phatick = [-180:60:180];
xlabel('\omega/\pi');
ylabel('Degrees');
title('Phase response');
set(gca,'XTick',wtick);
set(gca,'YTick',phatick);

