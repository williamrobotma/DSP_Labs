%Question 1c
x = [4 3 2 1 1 2 3 4];
n = [0:7];
w = linspace(-pi, pi, 501);

X = dtft(x,n,w);
yabs = abs(X);
yang = angle(X);

figure(2)
subplot(211)
plot(w/pi, yabs,'LineWidth',1.5);
wtick = [-1:0.2:1];
magtick = [0:5:20];
axis([-1 1 0 20]);
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
