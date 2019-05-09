%Make one wav with multiple different rolls

%load waveform
[cover1, Fs] = audioread('./brown_samples/freqsweep/brownnoise_F-0.2.wav');
[cover2, Fs] = audioread('./brown_samples/freqsweep/brownnoise_F-0.1.wav');
[cover3, Fs] = audioread('./brown_samples/freqsweep/brownnoise_F-0.35.wav');
[cover4, Fs] = audioread('./brown_samples/freqsweep/brownnoise_F-0.45.wav');
[cover5, Fs] = audioread('./brown_samples/freqsweep/brownnoise_F-0.3.wav');

%combine and output
finalNoise = [cover1;cover2;cover3;cover4;cover5];
figure;
plot(finalNoise)
audiowrite('rolling_freq_sweep_rand.wav',finalNoise,48000)