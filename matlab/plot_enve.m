clear, clc, close all

% load a sound file
[x, fs] = audioread('../audio_sample/12.wav');  
x = x/max(abs(x));                  % normalize
N = length(x);                      % length
t = (0:N-1)/fs;                     % time

% power spectrum
nfft = get_pow_2(N);
spec = fft(x,nfft);
f = fs/N*(0:round(nfft/2)-1);
f = f/1000;                     % convert to kHz
spec = spec(1:round(nfft/2));
spec = abs(spec);               % amplitude
spec_dB = log(spec);            % amplitude in dB

% spectral envelope
enve = SpecEnvelope(x, fs);

% cepstral analysis
[C, q] = cepstrum(x, fs);
q = q*1000;                 % convert to ms 

% plot spectrum
subplot(3,1,1)
plot(f, spec_dB, 'b')
grid on
xlim([0 8])
ylim([-5 10])
title('log spectrum (0 - 8kHz)')
xlabel('Frequency/kHz')
ylabel('Magnitude/dB')

% plot spectral envelope
subplot(3,1,2)
plot(f, enve, 'b')
grid on
xlim([0 8])
ylim([-5 10])
% ylim([min(Xm)-10 max(Xm)+10])
title('Spectral Envelope (0 - 8kHz)')
xlabel('Frequency/kHz')
ylabel('Magnitude/dB')

% plot glottal pulse
subplot(3,1,3)
plot(f, spec_dB-enve, 'b')
grid on
xlim([0 8])   
ylim([-5 10])
xlabel('Frequency/kHz')
ylabel('Magnitude/dB')
title('Glottal Pulse (0 - 8kHz)')