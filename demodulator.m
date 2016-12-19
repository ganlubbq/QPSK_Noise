function [output] = demodulator(snqpsk)
 
    r=snqpsk;
    bhat = [real(r)<0;imag(r)<0];
    bhat = bhat(:)';
    bhat1 = bhat;
    
    output = bhat1;
end