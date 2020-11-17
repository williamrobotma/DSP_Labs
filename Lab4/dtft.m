function [X] = dtft(x,n,w)
% Computes Discrete-time Fourier Transform
% [X] = dtft(x,n,w)
%
% X = DTFT values computed at w frequencies
% x = finite duration sequence over n (row vector)
% n = sample position row vector
% w = frequency row vector
X = exp(-1i*w'*n)  * x.';
end