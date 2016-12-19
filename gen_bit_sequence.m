function [output] = gen_bit_sequence(sequence_len)
    output = (randn(1, sequence_len) > 0.5);
end