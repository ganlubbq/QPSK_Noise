function [BER1, SNR1] = error_rate_computation(b, bhat, sequence_len, SNR, BER1, SNR1)

    ne = sum(b ~= bhat);
    BER = ne / sequence_len;
    BER1 = [BER1 BER];
    SNR1 = [SNR1 SNR];
end