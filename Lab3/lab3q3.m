clc, clear
%Thomas Gatto 101039302
x = @(t) exp(-1000*abs(t)); %creating function that will be reconstructed 
Fs = 5000; %sampling frequency 
t = -0.005:1/Fs:0.005; %x axis to feed to the spline fucntion 
Y = x(t); %the values to give to the spline function 

%% Plotting Sampled Signal 
figure(1)
subplot(2,1,1)
stem(t, Y)
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

%% Reconstructing the Signal Using a Cubic Spline 
dt=0.00005; % steps given ?0.005 ???0.005. and -25 ??? 25
t_reconstructed = t(1):dt:t(length(t));
splineResult = spline(t, Y, t_reconstructed); %need to use the sampled rate 
subplot(2,1,2)
plot(t_reconstructed, splineResult)
hold on
plot(t_reconstructed, x(t_reconstructed))
xlabel('t')
ylabel('exp(-1000*abs(t))')
title('Analog signal xa(t) with reconstructed signal from 5000 Hz')
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
%% finding the maximum air 
max_error5000 = max(abs(x(t_reconstructed)-splineResult));
fprintf("The maximum error when reconstructing using cubic spline at 5000 Hz is %f\n", max_error5000)

%% Fs at 1000 Hz
x = @(t) exp(-1000*abs(t)); %creating function that will be reconstructed 
Fs = 1000; %sampling frequency 
t = -0.005:1/Fs:0.005; %x axis to feed to the spline fucntion 
X = x(t); %the values to give to the spline function 

%% Plotting the sampled Frequency 
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

%% Making the reconstructed signal at 1000 Hz
dt=0.00005; % steps given ?0.005 ???0.005. and -25 ??? 25
R=[t(1)*Fs, t(length(t))*Fs];

t_reconstructed = t(1):dt:t(length(t));
x_reconstructed = spline(t, X, t_reconstructed); %need to use the sampled rate 

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

%% Finding the Maximum Error 
max_error1000 = max(abs(x(t_reconstructed)-x_reconstructed));
fprintf("The maximum error when reconstructing using cubic spline at 1000 Hz is %f\n", max_error1000)
