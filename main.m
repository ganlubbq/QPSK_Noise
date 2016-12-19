clear % Clear before Run.

sequence_len = 64000; % Consider 64KHz System

% Signal generated from sender.
b = gen_bit_sequence(sequence_len);

% Signal Modulate
qpsk = modulator(b, sequence_len);

subplot(2, 2, 1);
plot(qpsk,'r+'); % plot constellation without AWGN
axis([-2 2 -2 2]);
grid on;
xlabel('real'); ylabel('imag');
title('QPSK constellation');

SNR = -10:10; % SNR range definition.
BER1=[];
SNR1=[];
sigma1=[];

% Insertion AWGN.
for SNR = -10:length(SNR)
    sigma = sqrt(10.0^(-SNR/10.0));
    sigma = sigma / 2;
    sigma1 = [sigma1 sigma];
    % Add noise to QPSK Gray coded signals.
    snqpsk = (real(qpsk) + sigma.*randn(size(qpsk))) + i.*(imag(qpsk) + sigma * randn(size(qpsk)));

    subplot(2, 2, 2);
    plot(snqpsk,'r+'); % QPSH with AWGN.
    axis([-2 2 -2 2]);
    grid on;
    xlabel('real'); ylabel('imag');
    title('QPSK with AWGN');

    bhat = demodulator(snqpsk); % Demoduleate the signal for receiver.
    % Err computing
    [BER1, SNR1] = error_rate_computation(b, bhat, sequence_len, SNR, BER1, SNR1);
end

subplot(2, 2, 3);
semilogy(SNR1,BER1,'-o'); % Plot the Log scale Graph.
axis([-10 10 10^(-5) 10^(0)]);
grid on; 
xlabel('SNR(dB)'); ylabel('BER');
title('BER-SNR Relation');
legend('QPSK');