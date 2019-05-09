
LSB_message_encode

%play waveform
load('handel.mat')
whos y Fs

player = audioplayer(y,Fs);

play(player);


LSB_message_decode
