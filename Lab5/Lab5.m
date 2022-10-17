%Lab 5 SYSC 4405

%% Read audio
[dat,Fs] = audioread('NoisyMessage.wav');
                  
T = 1/Fs;             % Sampling period       
L = length(dat);        % Length of signal
t = (0:L-1)*T;        % Time vector

%% Plot unfiltered audio
figure (1)
subplot(311)

plot(0:(T):((L-1)/Fs), dat)
ylim([-0.4 0.4])
title('Audio Waveform')
xlabel('Time (Seconds)')
ylabel('Amplitude (Volts)')

%computing the fourier transform
subplot(312)
Y = fft(dat); % Compute the fourrier transform 
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
f = Fs*(0:(L/2))/L;
plot(f,P1) 
title('Single-Sided Amplitude Spectrum of Noisy Message')
xlabel('f (Hz)')
ylabel('|a(f)| (Volts)') 

subplot(313)
P2 = angle(Y);
P1 = P2(1:L/2+1);
plot(f,P1./pi)
title('Single-Sided Angle Spectrum of Noisy Message')
xlabel('f (Hz)')
ylabel('Phase Spectrum (\times\pi rad)') 

% Loading filters
notch = notch500;
notch = notch.Numerator;

low_pass = LowPass;
low_pass = low_pass.Numerator;

gain = [100];

%% Filter stage 1
dat_filtered = filter(low_pass, 1, dat);

figure (2)
subplot(311)

plot(0:(T):((L-1)/Fs), dat_filtered)
ylim([-0.4 0.4])
title('Low-Passed Audio Waveform')
xlabel('Time (Seconds)')
ylabel('Amplitude (Volts)')

%computing the fourier transform
subplot(312)
Y = fft(dat_filtered); % Compute the fourrier transform 
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
f = Fs*(0:(L/2))/L;
plot(f,P1) 
title('Single-Sided Amplitude Spectrum of Low-Passed Message')
xlabel('f (Hz)')
ylabel('|a(f)| (Volts)') 

subplot(313)
P2 = angle(Y);
P1 = P2(1:L/2+1);
plot(f,P1./pi)
title('Single-Sided Angle Spectrum of Low-Passed Message')
xlabel('f (Hz)')
ylabel('Phase Spectrum (\times\pi rad)') 


%% Filter Stage 2
dat_filtered = filter(notch, 1, dat_filtered);

figure (3)
subplot(311)

plot(0:(T):((L-1)/Fs), dat_filtered)
ylim([-0.4 0.4])
title('Filtered Audio Waveform')
xlabel('Time (Seconds)')
ylabel('Amplitude (Volts)')

%computing the fourier transform
subplot(312)
Y = fft(dat_filtered); % Compute the fourrier transform 
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
f = Fs*(0:(L/2))/L;
plot(f,P1) 
title('Single-Sided Amplitude Spectrum of Filtered Message')
xlabel('f (Hz)')
ylabel('|a(f)| (Volts)') 

subplot(313)
P2 = angle(Y);
P1 = P2(1:L/2+1);
plot(f,P1./pi)
title('Single-Sided Angle Spectrum of Filtered Message')
xlabel('f (Hz)')
ylabel('Phase Spectrum (\times\pi rad)') 


%% Filter Stage 3
dat_filtered = filter(gain, 1, dat_filtered);

figure (4)
subplot(311)

plot(0:(T):((L-1)/Fs), dat_filtered)
ylim([-0.4 0.4])
title('Filtered Audio Waveform with Gain')
xlabel('Time (Seconds)')
ylabel('Amplitude (Volts)')

%computing the fourier transform
subplot(312)
Y = fft(dat_filtered); % Compute the fourrier transform 
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
f = Fs*(0:(L/2))/L;
plot(f,P1) 
title('Single-Sided Amplitude Spectrum of Filtered Message with 100x Gain')
xlabel('f (Hz)')
ylabel('|a(f)| (Volts)') 

subplot(313)
P2 = angle(Y);
P1 = P2(1:L/2+1);
plot(f,P1./pi)
title('Single-Sided Angle Spectrum of Filtered Message with 100x Gain')
xlabel('f (Hz)')
ylabel('Phase Spectrum (\times\pi rad)') 

%% Write out file
audiowrite('NoisyMessage_filtered.wav',dat_filtered,Fs);
clear y Fs

%% Plot frequency responses of 3 filters

figure(5)
freqz(low_pass,1);
title('Frequency Response of FIR Low-Pass Filter')

figure(6)
freqz(notch,1);
title('Frequency Response of FIR Notch Filter')

figure(7)
freqz(gain,1);
title('Frequency Response of Gain')
%% Write frequency response functions to file
syms omega
% low_pass
p = poly2sym(fliplr(low_pass), omega);
p2 = subs(p, omega, exp(-j*omega)); 

fid = fopen('low_pass_freq.txt', 'wt');
fprintf(fid, '%s\n', p2);
fclose(fid);

fid = fopen('low_pass_impulse.txt', 'wt');
fprintf(fid, '%d, ', low_pass);
fclose(fid);

% notch
p = poly2sym(fliplr(notch), omega);
p2 = subs(p, omega, exp(-j*omega)); 

fid = fopen('notch_freq.txt', 'wt');
fprintf(fid, '%s\n', p2);
fclose(fid);

fid = fopen('notch_impulse.txt', 'wt');
fprintf(fid, '%d, ', notch);
fclose(fid);

%gain
p = poly2sym(fliplr(gain), omega);
p2 = subs(p, omega, exp(-j*omega)); 

fid = fopen('gain_freq.txt', 'wt');
fprintf(fid, '%s\n', p2);
fclose(fid);

fid = fopen('gain_impulse.txt', 'wt');
fprintf(fid, '%d, ', gain);
fclose(fid);