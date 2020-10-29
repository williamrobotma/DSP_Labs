function sample_bits = coder(R, totalbits, xq)
%sample_bits(R, totalbits, xq) encodes quantized signal in terms of 
%quantization range
% Inputs:
%   R: quantization input range, i.e., [min_in, max_in];
%   totalbits: total number of bits to digitize the input signal
%   X: quantized input vector
% Outputs:
%   sample_bits: an array of strings in unsigned binary format.

    
    
    
    sz = size(xq);
    if sz(1) > sz(2)
        xq = xq.';
    end
    
    % reconstruct levels
    R_max = R(2);
    R_min = R(1);

    q_lev = 2^totalbits;
    step = (R_max - R_min)/(q_lev-1);

    % array for all the possible levels
    levels = R(1):step:R(2);

    % Assign closest index between each value and the predefined levels
    sample_int = zeros(1, length(xq));
    for m=1:length(xq)
        [Y, I] = min(abs(xq(m)-levels));
        sample_int(m) = I;    
    end
    
    sample_bits = strings(length(sample_int),1);
    for m=1:length(sample_int)
        [B, O] = dec2bi(sample_int(m)-1, totalbits);
        sample_bits(m) = B;
    end

    return
end

function [bin_num, overflow] = dec2bi(n, totalbits)
    
    overflow = false;
    bin_num = strings;
    for m=1:totalbits
        bin_num=strcat(string(mod(n,2)), bin_num);
        n = floor(n/2);
    end
    
    if (n > 0)
        overflow = true;
    end

    return
end

