close all;clc;
finalNoise = 0;
%Create a series of brown noise samples modulated with different wave
%frequencies
F = 0.05:0.05:0.5;
for wf = F
   %Time specifications:
   Fs = 48000;                   % samples per second
   dt = 1/Fs;                   % seconds per sample
   StopTime = 1/wf;             % seconds
   t = (0:dt:StopTime-dt)';     % seconds
   %%Sine wave:
   Fc = wf;                     % hertz
   rollingTide = 0.25.*sin(2*pi*Fc*t)+0.75;
   %generate same length of noise
   %Specify how long the noise should be for
   Length_Of_Noise = 1/wf;
   No_Noise_Samples = floor(Length_Of_Noise*48000);

   %Create 1 second of 2 channel brown noise
   noiseSig = dsp.ColoredNoise('Color','brown','SamplesPerFrame',No_Noise_Samples,...
    'NumChannels',1);

   %Modulate with sine
   brownNoiseRolling = 0.01.*rollingTide.*noiseSig();
   %Write audio output
   filename = strcat('brownnoise_F-',num2str(wf), '.wav');
   audiowrite(filename,brownNoiseRolling,48000);
   
   %figure
   %plot(brownNoiseRolling)
   %title(filename);
   
   finalNoise = [finalNoise;brownNoiseRolling];
end
figure;
plot(finalNoise)
audiowrite('rolling_freq_sweep_F-005-5.wav',finalNoise,48000)

