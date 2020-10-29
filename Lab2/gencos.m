function [x] = gencos(freq, amp, phase, tt)
% This function generates a cosine wave.
% freq: frequency of cosine in Hertz
% amp: amplitude of cosine
% phase: phase of cosine
% tt: time vector
x = amp * cos(2 * pi * freq * tt + phase);