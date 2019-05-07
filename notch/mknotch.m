[y, fs] = audioread('./brownnoise.wav');

y = (y(:,1));

NFFT = 8000;
Y = fftshift(fft(y, NFFT));
fvals = fs*(-NFFT/2:NFFT/2-1)/NFFT;
% plot(fvals, abs(Y));

y = y(1:22000);

n6000 = notch_6000;
n7000 = notch_7000;

mono_6000 = filter(n6000, y);
mono_7000 = filter(n7000, y);

audiowrite('6000.wav', mono_6000, fs);
audiowrite('7000.wav', mono_7000, fs);
audiowrite('mono.wav', y, fs);

% soundsc(y, fs);
