function [output] = modulator(b, sequence_len)

    d = zeros(1,sequence_len / 2);
    
    for n = 1:sequence_len / 2
        p = b(2*n);
        imp = b(2*n-1);
        if (imp == 0)&(p == 0) % 1/4 PI degrees
            d(n)  =exp(j * pi / 4);
        end
        if (imp == 1)&(p == 0) % 3/4 PI degrees
            d(n) = exp(j * 3 * pi / 4);
        end
        if (imp == 1)&(p == 1) % 5/4 PI degrees
            d(n) = exp(j * 5 * pi / 4);
        end
        if (imp == 0)&(p == 1) % 7/4 PI degrees
            d(n)=exp(j * 7 * pi / 4);
        end
    end
    
    output = d;
end