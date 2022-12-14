clear all
close all
clc

prompt1= "Number of bits for the signal?";
datacount = input(prompt1);


choice = menu("NoiseType","AWGN","CalculatedSNR")

%Adding a random noise signal
if choice ==1


  for var = 1/50:1/10:0.5

    noise = 1/sqrt(2)*(randn(1,datacount) + j*randn(1,datacount))*var
    addNoise = signal+noise

  figure(1);
  plot(real(addNoise),imag(addNoise),'r*');
  drawnow('expose')

  noise_power = mean(abs(noise).^2)

  %SNR Calculation
   SNRCal(datacount)
  end

%Adding SNR Calculated noise signal
 elseif choice==2
   for snr = 0:1:10 %in decibels

     snr_linear = 10*(snr/10)
     var2 = signal_power/snr_linear
     noise = 1/sqrt(2)*(randn(1,datacount) + j*randn(1,datacount))*var2
     addNoise = signal+noise

   figure(2);
   plot(real(addNoise),imag(addNoise),'r*');
   drawnow('expose')
   end


end

