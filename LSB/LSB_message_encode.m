close all;clc;

%Specify how long the noise should be for
Length_Of_Noise = 10;
No_Noise_Samples = Length_Of_Noise*48000;

%Create 1 second of 2 channel brown noise
dualchannelbrown = dsp.ColoredNoise('Color','brown','SamplesPerFrame',No_Noise_Samples,...
    'NumChannels',2);

%Make it into separate functions
brownNoise = 0.01.*dualchannelbrown();


subplot(2,1,1);
plot(brownNoise(:,1));
subplot(2,1,2);
plot(brownNoise(:,2));

dualChannelPink = dsp.ColoredNoise('Color','pink','SamplesPerFrame',No_Noise_Samples,...
    'NumChannels',2);
%Make it into separate functions
pinkNoise = 0.01.*dualChannelPink();

pink_brown = pinkNoise.*brownNoise;


audiowrite('pink_brown_Noise.wav',pink_brown,48000);


