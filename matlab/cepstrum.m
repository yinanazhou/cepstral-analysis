function [C, q] = cepstrum(x, fs)
% Calculate cepstrum
% 
% x - input (time domain)
% fs - sampling rate/Hz
% C - real cepstrum
% q - quefrency/s

% convert to column vector
x = x(:);

N = length(x);                          % length

q = transpose((0:round(N/2)-1)/fs);     % quefrency

% windowing
win = hanning(N, 'periodic');
x = x.*win;

% cepstral analysis
nfft = get_pow_2(N);
C = real(ifft(log(abs(fft(x, nfft).^2)))); 
C = C(1:round(N/2));                  % one side  
C = C.^2;
end