%% Question 1
%1.1
function out = xa_sinc(X, m, dt, n0, R, Fs)
%xa_sinc(X, m, dt, n0, R, Fs) reconstructs sampled signal using sinc
% Inputs:
%   X: sampled signal;
%   m: output steps
%   dt: time difference between output steps
%   n0: Position in X array that corresponds n=0
%   R: Range of n values to reconstruct using sinc, i.e. [n1, n2]
%   Fs: Sampling rate of X
% Outputs:
%   out: Output array of reconstructed values.
    n1 = R(1);
    n2 = R(2);
    
    Ts = 1/Fs;
    
    
    
    eqn = @(t) sum(X((n0+n1):(n0+n2)).*sinc(Fs.*(t-((n1):(n2)).*Ts)));
    
    out = zeros(1, length(m));
    for g=1:length(m)
        out(g) = eqn(m(g)*dt);
    end

return 
end

function outsinc = sinc(x)
    outsinc=zeros(1,length(x));    
    for m=1:length(x)
        
        if x(m)==0
            outsinc(m) = 1;
        else
            outsinc(m) = sin(pi*x(m))/(pi*x(m));
        end
    end

    return
end
