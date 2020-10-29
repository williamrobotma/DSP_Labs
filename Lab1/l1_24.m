%% 2.4 (b)
xx = [ zeros(1,3), linspace(-1,0,5), ones(1,4) ]
xx(4:6)
size(xx)
length(xx)
xx(2:2:length(xx))

%% 2.4 (c)
yy = xx
yy(4:6) = pi*(1:3)

% replace even indexed with 3
xx(2:2:length(xx)) = 3