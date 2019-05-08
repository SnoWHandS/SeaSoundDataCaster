[s1, fs] = audioread('./freqsweep/1.wav');
[s2, fs] = audioread('./freqsweep/2.wav');
[s3, fs] = audioread('./freqsweep/3.wav');
[s4, fs] = audioread('./freqsweep/4.wav');
[s5, fs] = audioread('./freqsweep/5.wav');
[s6, fs] = audioread('./freqsweep/6.wav');
[s7, fs] = audioread('./freqsweep/7.wav');
[s8, fs] = audioread('./freqsweep/8.wav');
[s9, fs] = audioread('./freqsweep/9.wav');
[s10, fs] = audioread('./freqsweep/10.wav');

pid = fopen('plaintext.bin', 'r');
plaintext = fread(pid, 'uint8');

bitcount = length(plaintext)*8

ttrans = 0.2;

otrans = ttrans * fs;
strans = ttrans*2 * fs;
nswap = otrans*0.4;

minsample = strans * bitcount;

mono = [];

while length(mono) < minsample

    index = randi([1,10]);
    switch index

    case 1
        mono = vertcat(mono, s1);
    case 2
        mono = vertcat(mono, s2);
    case 3
        mono = vertcat(mono, s3);
    case 4
        mono = vertcat(mono, s4);
    case 5
        mono = vertcat(mono, s5);
    case 6
        mono = vertcat(mono, s6);
    case 7
        mono = vertcat(mono, s7);
    case 8
        mono = vertcat(mono, s8);
    case 9
        mono = vertcat(mono, s9);
    case 10
        mono = vertcat(mono, s10);
    otherwise
        mono = mono;
    end

end

length(mono)/strans

n1 = notch_6000;
n0 = notch_7000;

i = 1;

output = [];

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

        notch(1:nswap) = (notch(1:nswap) + leading_trans)/2;

        notch(end-nswap+1: end) = (notch(end-nswap+1: end) + trailing_trans)/2;

        mono(i*strans:(i*strans)+otrans) = notch;

        i = i + 1;

    end

end

audiowrite('output.wav', mono, fs);
