fid = fopen('output.wav','r');
header = fread(fid,40,'uint8=>char');
dsize  = fread(fid,1,'uint32');
stego  = fread(fid,inf,'uint16');
fclose(fid);

fid = fopen('base.wav','r');
header = fread(fid,40,'uint8=>char');
dsize  = fread(fid,1,'uint32');
original  = fread(fid,inf,'uint16');
fclose(fid);

%NC(stego,original)


stego = audioread('output.wav');
original = audioread('base.wav');
NC(stego,original)
