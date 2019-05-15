fid = fopen('brownnoise_F-0.5_stego.wav','r');
header = fread(fid,40,'uint8=>char');
dsize  = fread(fid,1,'uint32');
stego  = fread(fid,inf,'uint16');
fclose(fid);

fid = fopen('brownnoise_F-0.5.wav','r');
header = fread(fid,40,'uint8=>char');
dsize  = fread(fid,1,'uint32');
original  = fread(fid,inf,'uint16');
fclose(fid);

NC(stego,original)