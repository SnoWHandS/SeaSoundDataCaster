[y, fs] = audioread('./output.wav');

sl = 1200;

f0 = 6000;
n0 = 764;

f1 = 7000;
n1 = 789;

j = 1;
state = 0;

gate = 2

length(y)

(j+1) * sl

while (j+1) * sl < length(y)

    sample = y(j*sl:(j+1)*sl);

    S = fft(sample, sl);

    Pyy = S.*conj(S)/sl;
    f = 1000/251*(0:(sl/2));
    plot(f,Pyy(1:1+ (sl/2)));
    title('Power spectral density');
    xlabel('Frequency (Hz)');

    bin0 = mean(Pyy(n0-gate: n0+gate));
    bin1 = mean(Pyy(n1-gate: n1+gate));

    j = j + 1;

end
