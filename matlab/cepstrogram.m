function [C, q, t] = cepstrogram(x, win, hop, fs)
% Calculate cepstrogram
% 
% x - input (time domain)
% win - analysis window
% hop - hop size
% fs - sampling rate/Hz
%
% C - real cepstrum matrix (time across columns, quefrency across rows)
% q - quefrency/s
% t - time/s

% convert to column vector
x = x(:);

xlen = length(x);           % input length
wlen = length(win);         % window length

nfft = ceil((1+wlen)/2);     % number of unique fft points
L = 1+fix((xlen-wlen)/hop); % number of signal frames
C = zeros(nfft, L);          % initialize cepstrum matrix

for l = 0:L-1
    % windowing
    xw = x(1+l*hop : wlen+l*hop).*win;
    
    % cepstrum calculation
    c = real(ifft(log(abs(fft(xw)))));
    
    % update cepstrum matrix
    C(:, 1+l) = c(1:nfft);
end

t = (wlen/2:hop:wlen/2+(L-1)*hop)/fs;   % time
q = (0:nfft-1)/fs;                       % quefrency
end