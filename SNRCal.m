%SNR_Tool Function

%This function generates a random bit stream for a presented bit count, does the BPSK Modulation
%adds a complex noise signal to the system and returns the values of the SNR and BER calculations
%for a specific bit count, under the condition that a BPSK model is used.

%Call the function SNRCal in order to receive the SNR value for a given bitcount.

%The use of the function to receive both the SNR and BER value outputs can be done
%by calling the function in the form of [a,b].

%Created by - Vishalya Sooriarachchi


function [SNRValue , BERValue] = SNRCal(bitcount)

signal_i=rand(1,bitcount)>0.5; %Generation of the data bits

%BPSK Modulated i component of the signal
BPSK=2*signal_i-1;


%q component of the signal
signal_q=zeros(1,bitcount);

%Complete signal
signal = complex(signal_i,signal_q)

for var= 1/50:1/10:0.5
noise = 1/sqrt(2)*(randn(1,bitcount) + j*randn(1,bitcount))*var
end

  signal_power = mean(abs(signal).^2)
  noise_power = mean(abs(noise).^2)

  SNRValue = 10*log10(signal_power/noise_power); %SNR Calculation done in dB


  signal_energy = (abs(signal).^2);

  BERValue =0.5*erfc(sqrt(signal_energy/noise_power));

endfunction
