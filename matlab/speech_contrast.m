clear, clc, close all

% load a sound file
% male
[male, fsmale] = audioread('./audio_sample/all_male.wav'); 
male = male/max(abs(male));                     % normalize
Nmale = length(male);
% female
[female, fsfemale] = audioread('./audio_sample/all_female.wav');  
female = female/max(abs(female));               % normalize
Nfemale = length(female); 

% male
% cepstrum
[Cmale, qmale] = cepstrum(male, fsmale);
qmale = qmale*1000;                    

% female
% cepstrum
[Cfemale, qfemale] = cepstrum(female, fsfemale);
qfemale = qfemale*1000;    

% pitch determination
male = pitchEstimateCepstrum(Cmale, fsmale)
female = pitchEstimateCepstrum(Cfemale, fsfemale)

% male
% plot of the cepstrum
% quefrencies from 1 ms (1000 Hz) to 50 ms (20 Hz)
subplot(2, 1, 1)
plot(qmale, Cmale, 'b')
grid on
xlim([1 50])      
xlabel('Quefrency/ms')
ylabel('Amplitude')
title('Male - Real Cepstrum (1ms -50 ms)')

% female
% plot of the cepstrum (1ms -50 ms)
subplot(2, 1, 2)
plot(qfemale, Cfemale, 'b')
grid on
xlim([1 50])      
xlabel('Quefrency/ms')
ylabel('Amplitude')
title('Female - Real Cepstrum (1ms -50 ms)')