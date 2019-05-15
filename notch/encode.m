pid = fopen('plaintext.bin', 'r');
plaintext = fread(pid, 'uint8');

bitcount = length(plaintext)*8

ttrans = 0.5;

otrans = ttrans * fs;
strans = ttrans*2 * fs;
nswap = otrans*0.4;

minsample = strans * bitcount + 10;

mono = [];

while length(mono) < minsample

    mono = vertcat(mono, bs);

end

length(mono)/strans

n1 = notch_1;
n0 = notch_0;

i = 1;

leading_scaler = rot90(linspace(1,0,nswap));
trailing_scaler = rot90(linspace(0,1,nswap));

for bytes = 1:length(plaintext)

    for bits = 1:8

        notch = mono(i*strans:(i*strans) + otrans);

        leading_trans = notch(1:nswap) .* leading_scaler;
        trailing_trans = notch(end-nswap+1: end) .* trailing_scaler;

        if (1 == bitget(plaintext(bytes), bits, 'uint8'))

            notch = filter(n1, notch);

        else
            
            notch = filter(n0, notch);

        end

        mono(i*strans:(i*strans)+otrans) = notch;
        i = i + 1;

    end

end

for k = 1:length(mono)
    mono(i) = mono(i) * (0.5 + (0.5*sin(k/400000)));
end

audiowrite('output.wav', mono, fs);
