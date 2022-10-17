%Lab 5 SYSC 4405
[dat,Fs] = audioread('NoisyMessage.wav');
%code from Lab 1
%Fs = 500;             % Sampling frequency from header                    
T = 1/Fs;             % Sampling period       
L = length(dat);        % Length of signal
t = (0:L-1)*T;        % Time vector
omega = 0:pi/250:pi;
n = (0:L-1);

figure (1)
subplot(211)
%assuming sampling frequency is 500 Hz
plot(0:(T):((L-1)/Fs), dat)
title('Audio Waveform')
xlabel('Time (Seconds)')
ylabel('Amplitude')

subplot(212)
%computing the fourier transform

Y = dtft(dat', n, omega); % Compute the fourrier transform 
% P2 = abs(Y/L);
% P1 = P2(1:L/2+1);
% P1(2:end-1) = 2*P1(2:end-1);
% f = Fs*(0:(L/2))/L;
% f = 0:(length(dat)-1);
% f = f.*(Fs/2)
plot(omega.*(Fs/(2*pi)),abs(Y)') 
title('Single-Sided Amplitude Spectrum of Message')
xlabel('f (Hz)')
ylabel('|a(f)|') 


notch = notch500;
low_pass = LowPass;
dat_filtered = [dat', zeros(1, 1000)]';
L = length(dat_filtered);        % Length of signal
t = (0:L-1)*T;        % Time vector
omega = 0:pi/1000:pi;
n = (0:L-1);


dat_filtered = filtfilt(notch.Numerator, 1, dat_filtered);
% dat_filtered = filtfilt(low_pass.Numerator, 1, dat_filtered);
% dat_filtered = dat_filtered.*100;
figure (2)
subplot(211)
%assuming sampling frequency is 500 Hz
plot(0:(T):((L-1)/Fs), dat_filtered)
title('Audio Waveform')
xlabel('Time (Seconds)')
ylabel('Amplitude')

subplot(212)
Y = dtft(dat_filtered', n, omega); % Compute the fourrier transform 
% P2 = abs(Y/L);
% P1 = P2(1:L/2+1);
% P1(2:end-1) = 2*P1(2:end-1);
% f = Fs*(0:(L/2))/L;
% f = 0:(length(dat_filtered)-1)
% f = f.*(Fs/2)
plot(omega.*(Fs/(2*pi)),abs(Y)') 
title('Single-Sided Amplitude Spectrum of Message')
xlabel('f (Hz)')
ylabel('|a(f)|') 

audiowrite('NoisyMessage_filtered.wav',dat_filtered,Fs);
clear y Fs

% %Applying Signal Conditioning Techniques 
% %In this case I will apply a low pass filter to remove the noise at
% %approximatley 60 Hz
% % Lowpass example 
% figure (3)
% a_filt_l = lowpass(dat,30,Fs);
% Y = fft(a_filt_l); % Compute the fourrier transform of one of the leads
% P2 = abs(Y/L);
% P1 = P2(1:L/2+1);
% P1(2:end-1) = 2*P1(2:end-1);
% f = Fs*(0:(L/2))/L;
% plot(f,P1) 
% title('Single-Sided Amplitude Spectrum of ECG signal (30 Hz low pass)')
% xlabel('f (Hz)')
% ylabel('|a(f)|') 
% 
% %Now prove that the signal conditioning worked 
% %by  putting the signal back in the time domain
% figure (4)
% plot(0:(1/500):((length(dat)-1)/500),a_filt_l)
% title('Filtered ECG Signal (LPF at 30 Hz)')
% xlabel('Time (Seconds)')
% ylabel('Amplitude')