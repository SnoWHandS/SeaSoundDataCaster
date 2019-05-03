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

%audiowrite('brown_noise.wav',rolling_Brown_Noise,48000);

%Input a message
message = fileread('message_to_encode.txt');
disp(message);

%Convert message to binary
binMessage = dec2bin(todecimal(message));
disp(binMessage);

%Decode binary to message
decodedMessage = strcat(char(bin2dec(binMessage)))
disp(decodedMessage);

