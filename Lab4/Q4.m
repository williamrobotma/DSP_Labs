%% Q4a)

w = linspace(-2*pi,2*pi,1001);
wl = length(w);
n = -30:1:30;
n1 = length(n);

xa = [1,1,1,1];
n = 0:3;

ya = dtft(xa, n, w);
yabs = abs(ya);
yang = angle(ya);

figure(1)
subplot(211)
plot(w/pi, yabs,'LineWidth',1.5);
axis([-2 2 0 4.5]);
wtick = [-2:0.1:2];
magtick = [0:0.5:4.5];
xlabel('\omega/\pi');
ylabel('|X|');
title('Q4 a) Magnitude response of DTFT');
set(gca,'XTick',wtick);
set(gca,'YTick',magtick);

subplot(212)
plot(w/pi, yang*180/pi,'LineWidth',1.5);
axis([-2,2,-180,180]);
phatick = [-360 0 360];
xlabel('\omega/\pi');
ylabel('Degrees');
title('Phase response of DTFT');
set(gca,'XTick',wtick);
set(gca,'YTick',phatick);

%% Q4b)
figure(2)
N = length(xa);
xn_dft = dft(xa, N)


stem((0:N-1), abs(xn_dft))

axis([-N N 0 4.5]);
wtick = [-2:0.1:2].*N/2;
magtick = [0:0.5:4.5];
xlabel('k');
ylabel('|X|');
title('Q4 b) Magnitude response of DFT');
set(gca,'XTick',wtick);
set(gca,'YTick',magtick);

%% Q4c)
xa_500 = [ones(1, 4) zeros(1, 16)];
N = length(xa_500);
xn_dft_500 = dft(xa_500, N)

figure(3)
stem((0:N-1), abs(xn_dft_500))

axis([-N N 0 4.5]);
wtick = [-2:0.1:2].*N/2;
magtick = [0:0.5:4.5];
xlabel('k');
ylabel('|X|');
title('Q4 c) Magnitude response of DFT, zero extended to N=20');
set(gca,'XTick',wtick);
set(gca,'YTick',magtick);

%% Q4d)
% 2*pi/N

%% Q4e)
N = length(xn_dft);
xa_reconstructed = idft(xn_dft, N)

%% Q4f)

xn_dft_pad = [xn_dft zeros(1,6)];
N=length(xn_dft_pad)
xa_pad = idft(xn_dft_pad, N)