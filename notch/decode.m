[y, fs] = audioread('./output.wav');

sl = 1200;

f0 = 8550;
n0 = 814;

f1 = 10550;
n1 = 865;

j = 1;
state = 0;

gate = 10

length(y)

(j+1) * sl

s0 = []
s1 = []

while (j+1) * sl < length(y)

    sample = y(j*sl:(j+1)*sl);

    S = abs(fftshift(fft(sample, sl)));

    dF = fs/sl;                      % hertz
    f = -fs/2:dF:fs/2-dF;

    length(S)

    bin0 = mean(abs(S(n0-gate: n0+gate)));
    bin1 = mean(abs(S(n1-gate: n1+gate)));

    s0 = [s0 bin0/bin1];
    s1 = [s1 bin1/bin0];

    j = j + 1;

end

hold on;

acc = 20;

plot(movmean(s0,acc));
plot(movmean(s1,acc), 'r');

s0 = movmean(s0, acc);
s1 = movmean(s1, acc);

state = -1;
threshold = 1.4;
underthreshold = 1;


out = [];

for i = 1:length(s0)

    if (s0(i) > threshold && s1(i) < underthreshold) && (state == -1)
        out = [out 1];
        state = 0;

    elseif (s1(i) > threshold && s0(i) < underthreshold) && (state == -1)
        out = [out 0];
        state = 1;

    elseif ((s0(i) < threshold && s1(i) < threshold) && (state ~= -1))
        state = -1;

    end

end

count = 1;

final = '';

while count+8 < length(out)
    final = strcat(final, char(bin2dec(int2str(fliplr(out(count:count+7))))));
    count = count + 8;
end

final
