clear all
close all
clc

prompt1= "Number of bits for the signal?";
datacount = input(prompt1);


choice = menu("Output Function","SNR","BER","SNR and BER")

%Adding a random noise signal
if choice ==1

  [SNR, ] =  SNRCal(datacount)


%Adding SNR Calculated noise signal
 elseif choice==2

  [, BER] = SNRCal(datacount)

 elseif choice==3

  [SNR,BER] = SNRCal(datacount)


  end

