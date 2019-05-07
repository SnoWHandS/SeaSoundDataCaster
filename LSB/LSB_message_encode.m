close all;clc;

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