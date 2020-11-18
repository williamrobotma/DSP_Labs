function [xn]=idft (Xk, N)
% Computes inverse discrete Fourier Transform
% [xn]=idft (Xk, N)
% Xk = DFT coeff array over 0 \leq k \leq (N-1)
% x= N point finite duration sequence
% N = Length of the DFT
n=[0:N-1]; %row vector for n
k=[0:N-1]; % row vector for k
WN=exp(1j*2*pi/N); % Wn factor
kn = k'*n; % Creates a NxN matrix of nk values
Wkn= WN.^kn; % DFT matrix
xn=(1/N)*Xk*Wkn; % Row vector of DFT coefficients

