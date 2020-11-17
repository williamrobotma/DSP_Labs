%Thomas Gatto 101039302 
%Lab 4 Question 2
%Hamming window
w = linspace(-pi,pi,501);
wtick = [-1:0.5:1];
magtick = [0:0.5:1.1];
%% M=10
M = 10;
n = 0:M;
x = (0.54-0.46*cos((2*pi*n)/(M-1)));
X = dtft(x,n,w);
magX = abs(X);
magX = magX/max(magX);
figure(1)
subplot(2,2,1);
plot(w/pi,magX,'LineWidth',1.5);
axis([-1 1 0 1.1]);
ylabel('|X|');
title('M = 10');
set(gca, 'XTick',wtick,'YTick',magtick);

%% M=25
M = 25;
n = 0:M;
x = (0.54-0.46*cos((2*pi*n)/(M-1)));
X = dtft(x,n,w);
magX = abs(X);
magX = magX/max(magX);
figure(1)
subplot(2,2,2);
plot(w/pi,magX,'LineWidth',1.5);
axis([-1 1 0 1.1]);
ylabel('|X|');
title('M = 10');
set(gca, 'XTick',wtick,'YTick',magtick);

%% M=50
M = 50;
n = 0:M;
x = (0.54-0.46*cos((2*pi*n)/(M-1)));
X = dtft(x,n,w);
magX = abs(X);
magX = magX/max(magX);
figure(1)
subplot(2,2,3);
plot(w/pi,magX,'LineWidth',1.5);
axis([-1 1 0 1.1]);
ylabel('|X|');
title('M = 10');
set(gca, 'XTick',wtick,'YTick',magtick);

%% M=101
M = 101;
n = 0:M;
x = (0.54-0.46*cos((2*pi*n)/(M-1)));
X = dtft(x,n,w);
magX = abs(X);
magX = magX/max(magX);
figure(1)
subplot(2,2,4);
plot(w/pi,magX,'LineWidth',1.5);
axis([-1 1 0 1.1]);
ylabel('|X|');
title('M = 10');
set(gca, 'XTick',wtick,'YTick',magtick);