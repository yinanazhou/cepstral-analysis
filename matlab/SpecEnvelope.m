function enve = SpecEnvelope(x, fs)
% Calculate spectral envelope
% 
% x - input (time domain)
% fs - sampling rate/Hz
% C - real cepstrum
% q - quefrency/s
% [x, fs] = audioread('trumpet_b.wav');  
% x = x/max(abs(x));                  % normalize

% convert to column vector
x = x(:);

% length of the signal
N = length(x);
N1 = round(fs*0.008);

% windowing
win = hanning(N, 'periodic');
x = x.*win;

% cepstral analysis
nfft = get_pow_2(N);
C = ifft(log(0.00001+abs(fft(x,nfft))),nfft);
C = C(:);

% lowpass
C_lp = [C(1);
        2*C(2:N1);
        C(N1+1);
        zeros(round(N/2)-N1-1, 1)];

% spectral envelope
enve = real(fft(C_lp, nfft));
enve = enve(1:nfft/2);
% enve = resample(enve,round(N/2),length(enve));
% plot(enve)
end