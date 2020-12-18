clear, clc, close all

% load a sound file
[x, fs] = audioread('./audio_sample/19_ee.wav'); 
x = x/max(abs(x));                  % normalize
N = length(x); 
t = (0:N-1)/fs;                     % time vector

% analysis parameters
wlen = 1024;                        % window length (power of 2)
hop = 256;                          % hop size (power of 2)

% cepstrogram
win = hamming(wlen, 'periodic');
[C, q, t2] = cepstrogram(x, win, hop, fs);
q = q*1000;                         % convert to ms

% remove quefrencies bellow 0.5 ms
C = C(q > 0.5, :); 
q = q(q > 0.5);                  

% plot time domain
subplot(3, 1, 1) 
plot(t, x)
grid on
xlim([0 0.5])
ylim([-1.1*max(abs(x)) 1.1*max(abs(x))])
xlabel('Time/s')
ylabel('Normalised amplitude')
title('Time domain')

% plot cepstrogram
subplot(5, 3, 7:15) 
[T, Q] = meshgrid(t2, q);
surf(T, Q, C)
shading interp
box on
axis([0 0.5 0 max(q)])
xlabel('Time/s')
ylabel('Quefrency/ms')
title('Cepstrogram of the signal')
view(0, 90)

% set colormap
colormap(flipud(bone(16)))
[cmin, cmax] = caxis;
caxis([0 cmax])