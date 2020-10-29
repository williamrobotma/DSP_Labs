function samples = sampler(A, f_in, f_s, N_s)
%samples Generates a continuous time waveform of form A*sin(2*pi*f_in*t),
% and will start at t=0 for N_s samples at a sampling rate of f_s with no 
% DC component
% Inputs:
%   A: amplitude of signal
%   f_in: frequency of signal
%   f_s: sampling frequency
%   N_s: Number of samples
% Outputs:
%   samples: Array of samples. The samples are from t=0 to t=(N - 1)/f_in



    x = @(t) A*sin(2*pi*f_in*t);
    Ts = 1/f_s;
    samples = x(0:Ts:(N_s-1));
end 

