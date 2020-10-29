clc, clear
% kset = 0:11;
% kset
% xk = cos( pi*kset/4 ) % Compute cosines

% yy = [ ]; %<--- initialize the yy vector to be empty
% for k= -5:5
%     yy(k+6) = cos( k*pi/3 );
% end
% yy

% Without for loop
k = (-5:5);
yy = cos(k.*pi./3)