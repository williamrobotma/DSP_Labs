Ts = 0.05; % Sampling period
tt = -2 : Ts : 3;
xx = cos( 2*pi*1.5*tt );
plot( tt, xx ), grid on %<--- plot a sinusoid
title('TEST PLOT of a SINUSOID')
xlabel('TIME (sec)')