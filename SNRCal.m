function [SNRValue , BERValue] = SNRCal(bitcount)

signal_i=rand(1,bitcount)>0.5; %Generation of the data bits

%BPSK Modulated i component of the signal
BPSK=2*signal_i-1;


%q component of the signal
signal_q=zeros(1,bitcount);

%Complete signal
signal = complex(signal_i,signal_q)
noise = 1/sqrt(2)*(randn(1,bitcount) + j*randn(1,bitcount))

  signal_power = mean(abs(signal).^2)
  noise_power = mean(abs(noise).^2)

  SNRValue = 10*log10(signal_power/noise_power); %SNR Calculation done in dB

  BERValue = 0.5*(1-(sqrt(SNRValue/2+SNRValue)));

endfunction

