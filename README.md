# QPSK_Noise
QPSK Modulation Demodulation

This is the code that measures the BER according to SNR when AWGN is added to QPSK.  
This code consists of the following four functions and the main statement that connects them.  
  
1.gen_bit_sequence: Makes the signal sent by the sender random.  
2. Modulator: Converts to QPSK.  
3. demodulator: The receiver interprets the transmitted signal as the original signal.  
4. error_rate_computation: Calculates the BER by comparing the signal sent by the sender with the signal received by the receiver.  
  
AWGM is added in the process between calling functions 2 and 3.
