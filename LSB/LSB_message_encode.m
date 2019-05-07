close all;clc;

%Specify how long the noise should be for
Length_Of_Noise = 10;
No_Noise_Samples = Length_Of_Noise*48000;

%Create 1 second of 2 channel brown noise
signlechannelbrown = dsp.ColoredNoise('Color','brown','SamplesPerFrame',No_Noise_Samples,...
    'NumChannels',1);

%Make it into separate functions
brownNoise = 0.01.*signlechannelbrown();

audiowrite('brownnoise.wav',brownNoise,48000);

%Rolling brown noise
%%Time specifications:
   Fs = 48000;                   % samples per second
   dt = 1/Fs;                   % seconds per sample
   StopTime = 10;             % seconds
   t = (0:dt:StopTime-dt)';     % seconds
   %%Sine wave:
   Fc = 0.25;                     % hertz
   rollingTide = cos(2*pi*Fc*t) +1.25;
   % Plot the signal versus time:
   figure;
   plot(t,rollingTide);
   xlabel('time (in seconds)');
   title('Signal versus Time');
   zoom xon;
   
%mod rolling sine with brown noise
rollingBrownNoise = 0.006.*rollingTide.*signlechannelbrown();

subplot(2,1,1);
plot(brownNoise);
subplot(2,1,2)
plot(rollingBrownNoise);

audiowrite('rollingbrownnoise.wav',rollingBrownNoise,48000);

%Input a message
message = fileread('message_to_encode.txt');
disp(message);

%Convert message to binary
binMessage = dec2bin(todecimal(message));
disp(binMessage);

%Decode binary to message
decodedMessage = strcat(char(bin2dec(binMessage)))
disp(decodedMessage);


fid = fopen('brownnoise.wav','r');
header = fread(fid,40,'uint8=>char');
dsize  = fread(fid,1,'uint32');
[cover,len_cover] = fread(fid,inf,'uint16');
fclose(fid);

%subplot(2,1,2)
%plot(cover)


%Convert noise to binary
binBrownNoise = de2bi(cover);

%Convert binary to noise signal
newBrownNoise = bi2de(binBrownNoise);

disp(len_cover)
disp(length(newBrownNoise))

%check diff

corrbnoise = corr(cover, newBrownNoise);

%figure()
%subplot(3,1,1)
%plot(newBrownNoise)
%subplot(3,1,2)
%plot(cover)
%subplot(3,1,3)
%plot(corrbnoise);