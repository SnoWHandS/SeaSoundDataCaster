[y, fs] = audioread('./6000.wav');

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

    S = abs(fftshift(fft(sample, sl)));

    dF = fs/sl;                      % hertz
    f = -fs/2:dF:fs/2-dF;

    length(S)

    bin0 = mean(S(n0-gate: n0+gate))
    bin1 = mean(S(n1-gate: n1+gate))

    plot(f, S);

    disp('sample done');

    j = j + 1;

end
