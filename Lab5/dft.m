function [Xk]=dft (xn, N)
% Computes discrete Fourier Transform
% [Xk] =dft (x, N)
% Xk = DFT coeff array over 0 \leq k \leq (N-1)
% x= N point finite duration sequence
% N = Length of the DFT
n=[0:N-1]; %row vector for n
k=[0:N-1]; % row vector for k
WN=exp(-j*2*pi/N); % Wn factor
nk = n'*k; % Creates a NxN matrix of nk values
Wnk= WN.^nk; % DFT matrix
Xk= xn*Wnk; % Row vector of DFT coefficients
