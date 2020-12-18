function [pitchEstimate] = pitchEstimate(c, fs)
% estimate pitch based on cepstral method
% 
% c - cepstrum
% fs - sampling rate
% 
% find peak between 2ms (=500Hz) and 20ms (=50Hz)
range2ms = floor(fs*0.002); % 2ms
range20ms = floor(fs*0.02); % 20ms
[maxIndex,maxTime]=max(abs(c(range2ms:range20ms)));
pitchEstimate = fs/(range2ms+maxTime-1);
end