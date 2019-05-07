[y, fs] = audioread('./brownnoise.wav');

y = (y(:,1));

NFFT = 8000;
Y = fftshift(fft(y, NFFT));
fvals = fs*(-NFFT/2:NFFT/2-1)/NFFT;
plot(fvals, abs(Y));



audiowrite('mono.wav', y, fs);

% soundsc(y, fs);
