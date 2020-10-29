%% 1.1
% See xa.m

%% 1.2
x = @(t) exp(-1000*abs(t));
Fs = 5000;

t = -0.005:1/Fs:0.005;
X = x(t);

%% 1.2a
figure(1)
subplot(2,1,1)
stem(t, X)
grid on
grid minor
xlabel('t')
ylabel('exp(-1000*abs(t))')
title('Analog signal xa(t) sampled at 5000 Hz')

% set ticks to ever 0.00005 seconds
set(gca,'xtick',t(1):0.00005:t(length(t)))

% remove tick labels
ax = gca;
labels = string(ax.XAxis.TickLabels); % extract
labels(2:4:end) = nan;
labels(3:4:end) = nan;
labels(4:4:end) = nan;% remove every other one
ax.XAxis.TickLabels = labels; % set



%% 1.2b
dt=0.00005; % steps given ?0.005 ???0.005. and -25 ??? 25
R=[t(1)*Fs, t(length(t))*Fs];

n0 = -(t(1) * Fs) + 1;

t_reconstructed = t(1):dt:t(length(t));
m = t_reconstructed./dt;
x_reconstructed = xa_sinc(X, m, dt, n0, R, Fs);

subplot(2,1,2)
plot(t_reconstructed, x_reconstructed)
hold on
plot(t_reconstructed, x(t_reconstructed))
xlabel('t')
ylabel('exp(-1000*abs(t))')
title('Analog signal xa(t) with reconstructed signal from 1000 Hz')
legend('Reconstructed Signal', 'Original Signal')

grid on
grid minor
% set ticks to ever 0.00005 seconds
set(gca,'xtick',t(1):0.00005:t(length(t)))

% remove tick labels
ax = gca;
labels = string(ax.XAxis.TickLabels); % extract
labels(2:4:end) = nan;
labels(3:4:end) = nan;
labels(4:4:end) = nan;% remove every other one
ax.XAxis.TickLabels = labels; % set

hold off


%% 1.2c
max_error5000 = max(abs(x(t_reconstructed)-x_reconstructed));
fprintf("The maximum error when reconstructing using sinc at 5000 Hz is %f\n", max_error5000)


%% 1.3
x = @(t) exp(-1000*abs(t));
Fs = 1000;

t = -0.005:1/Fs:0.005;
X = x(t);

%% 1.3a
figure(2)
subplot(2,1,1)
stem(t, X)
grid on
grid minor
xlabel('t')
ylabel('exp(-1000*abs(t))')
title('Analog signal xa(t) sampled at 1000 Hz')

% set ticks to ever 0.00005 seconds
set(gca,'xtick',t(1):0.00005:t(length(t)))

% remove tick labels
ax = gca;
labels = string(ax.XAxis.TickLabels); % extract
labels(2:4:end) = nan;
labels(3:4:end) = nan;
labels(4:4:end) = nan;% remove every other one
ax.XAxis.TickLabels = labels; % set



%% 1.3b
dt=0.00005; % steps given ?0.005 ???0.005. and -25 ??? 25
R=[t(1)*Fs, t(length(t))*Fs];

n0 = -(t(1) * Fs) + 1;

t_reconstructed = t(1):dt:t(length(t));
m = t_reconstructed./dt;
x_reconstructed = xa_sinc(X, m, dt, n0, R, Fs);

subplot(2,1,2)
plot(t_reconstructed, x_reconstructed)
hold on
plot(t_reconstructed, x(t_reconstructed))
xlabel('t')
ylabel('exp(-1000*abs(t))')
title('Analog signal xa(t) with reconstructed signal from 1000 Hz')
legend('Reconstructed Signal', 'Original Signal')

grid on
grid minor
% set ticks to ever 0.00005 seconds
set(gca,'xtick',t(1):0.00005:t(length(t)))

% remove tick labels
ax = gca;
labels = string(ax.XAxis.TickLabels); % extract
labels(2:4:end) = nan;
labels(3:4:end) = nan;
labels(4:4:end) = nan;% remove every other one
ax.XAxis.TickLabels = labels; % set

hold off


%% 1.3c
max_error1000 = max(abs(x(t_reconstructed)-x_reconstructed));
fprintf("The maximum error when reconstructing using sinc at 1000 Hz is %f\n", max_error1000)
