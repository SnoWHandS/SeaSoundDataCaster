
%Pop up to ask for cover audio file
[FileName,PathName] = uigetfile({'*.wav'}, 'Select cover audio:', 'rolling_freq_sweep_F-005-5.wav');
[file.path,file.name,file.ext] = fileparts([PathName FileName]);

%Assign audio in and audio out
audioIn = [PathName FileName];
audioOut = [file.path '/' file.name '_stego' file.ext];

%Pop up to ask for message file
[MessageFileName,PathName] = uigetfile({'.txt'}, 'Select message file:', 'message_to_encode.txt');
message = fileread(MessageFileName);

%Run message encoder with LSB
LSB_message_encode(audioIn, audioOut, message);

%play waveform
[cover, Fs] = audioread(audioOut);
player = audioplayer(cover,Fs);
play(player);

%Pop up to ask for stego audio file
[FileNameStego,PathNameStego] = uigetfile({'*.wav'}, 'Select audio to analyse:', 'rolling_freq_sweep_F-005-5_stego.wav');
audioStegoIn = [PathNameStego FileNameStego];

%Decode message
decipheredMessage = LSB_message_decode(audioStegoIn);
%display decoded message
disp(decipheredMessage)