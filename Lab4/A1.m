%Question 1a
w = linspace(-pi,pi,501);
wl = length(w)
n = -30:1:30;
n1 = length(n)

step1 = n >= -10;
step2 = n >= 11;
stepsum = step1-step2;

x1 = (0.6).^abs(n);
xa = x1.*stepsum;

ya = dtft(xa, n, w);
yabs = abs(ya);
yang = angle(ya);

figure(2)
subplot(211)
plot(w/pi, yabs,'LineWidth',1.5);
axis([-1 1 0 4.5]);
wtick = [-1:0.2:1];
magtick = [0:0.5:4.5];
xlabel('\omega/\pi');
ylabel('|X|');
title('Magnitude response');
set(gca,'XTick',wtick);
set(gca,'YTick',magtick);

subplot(212)
plot(w/pi, yang*180/pi,'LineWidth',1.5);
axis([-1,1,-180,180]);
phatick = [-180 0 180];
xlabel('\omega/\pi');
ylabel('Degrees');
title('Phase response');
set(gca,'XTick',wtick);
set(gca,'YTick',phatick);

