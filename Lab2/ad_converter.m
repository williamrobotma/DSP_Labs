function [output,sqnr] = ad_converter(A, f_in, f_s, N_s, totalbits, trunc, code)
%AD_CONVERTER ADC generates a signal and returns its quantized or bits.
% The generated signal is a sinusoid of form, A*sin(2*pi*f_in*t), and will 
% start at t=0 for N_s samples at a sampling rate of f_s with no DC
% component
% Inputs:
%   A: amplitude of signal
%   f_in: frequency of signal
%   f_s: sampling frequency
%   N_s: Number of samples. The samples are from t=0 to t=(N - 1)/f_in
%   totalbits: Bit depth
%   trunc: If true, quantizer truncates signal, else rounds to nearest
%   level. Default is false.
%   code: If true, encoder is enabled and output is an array of strings 
%   in unsigned binary format. If false, quantizer output is produced as an 
%   array of floating point values.
% Outputs:
%   output: If encoder is enabled, output is an array of strings in 
%   unsigned binary format. If disabled, quantizer output is produced as an 
%   array of floating point values.
%   sqnr: 

%% Set default arguments
if isempty(trunc)
    trunc = false
end
if isempty(code)
    code = true
end

%% Sampler
sampled = sampler(A, f_in, f_s, N_s);


%% Quantizer
if trunc
    quantized = adc_trunc([-A A], totalbits, sampled);
else
    quantized = adc([-A A], totalbits, sampled);
end

%% Coder
if code
    output = coder([-A A], totalbits, quantized);
else
    output = quantized
end

%% SQNR
sqnr = 1.76+6.02*totalbits;

return
end

