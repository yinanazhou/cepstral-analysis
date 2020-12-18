clear, clc, close all

% load a sound file
[x, fs] = audioread('./audio_sample/all_male.wav');  
x = x/max(abs(x));                  % normalize
N = length(x); 
t = (0:N-1)/fs;
t = t*1000;                         % convert to ms 

% power spectrum
nfft = get_pow_2(N);
spec = fft(x,nfft);
f = fs/N*(0:round(nfft/2)-1);
f = f/1000;                 % convert to kHz
spec = spec(1:round(nfft/2));
spec = abs(spec);           % amplitude
% pow_spec = spec.^2;         % power spectrum
% spec_dB = 20*log10(spec);   % amplitude in dB
spec_dB = log(spec);        % amplitude in dB
% spectral envelope
enve = SpecEnvelope(x, fs);
% enve_dB = log(enve); 

% cepstral analysis
[C, q] = cepstrum(x, fs);
q = q*1000;                 % convert to ms 
% violin = pitchEstimateCepstrum(C, fs)

% plot time domain
subplot(3,1,1)
plot(t, x, 'b')
xlim([0 max(t)])
ylim([-1.1*max(abs(x)) 1.1*max(abs(x))])
grid on
xlabel('Time/ms')
ylabel('Normalized amplitude')
title('Time Domain')

% plot spectrum
subplot(3,1,2)
plot(f, spec_dB, 'b')
% plot spectral envelope
hold on
plot(f, enve, 'r')
grid on
xlim([0 8])
% ylim([min(Xm)-10 max(Xm)+10])
title('Logarithm Spectrum (0 - 8kHz)')
xlabel('Frequency/kHz')
ylabel('Magnitude/dB')

% plot cepstrum (1ms -50 ms)
subplot(3,1,3)
plot(q, C, 'b')
grid on
xlim([1 30])      
xlabel('Quefrency/ms')
ylabel('Amplitude')
title('Real Cepstrum (1ms -30 ms)')