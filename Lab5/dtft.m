function [X] = dtft(x,n,w)
% Computes Discrete-time Fourier Transform
% [X] = dtft(x,n,w)
%
% X = DTFT values computed at w frequencies
% x = finite duration sequence over n (row vector)
% n = sample position row vector
% w = frequency row vector
X = exp(-1i*w'*n)  * x.';
% This function is from https://www.mathworks.com/matlabcentral/answers/469374-dtft-possible-on-matlab#answer_426731
end