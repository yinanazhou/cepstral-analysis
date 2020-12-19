clear, clc;

% plot mfcc

[x, fs] = audioread('../audio_sample/violin_a4.wav');

M = 24;
framelen = 256;
hop = framelen/2;

% DCT coefficients
num_dct = 13;           % # MFCC coeffiecients
dctcoef = zeros(M,M);
for k=1:num_dct
    n=0:23;
    dctcoef(k,:)=cos((2*n+1)*k*pi/(2*24));
end

% mel filterbank
bank=melbankm(M,framelen,fs,0,0.4,'t');
% normalized mel filterbank coefficients
bank=full(bank); % convert sparse matrix to normal matrix
bank=bank/max(bank(:));

% emphasize high frequencies
% H(z) = 1-alpha*z^(-1)
x = filter([1 -0.97],1,double(x));
% frame
frames = enframe(x, framelen, hop);
mfcc = zeros(num_dct,size(frames,1));
for i=1:size(frames,1)
    f = frames(i,:);
    % hamming window
    window = f'.*hamming(framelen);
    % amplitude spectrum
    t = abs(fft(window));
    % power spectrum
    t = t.^2;
    % mel filterbank, log, DCT
    c1=dctcoef*log(bank*t(1:size(bank,2)));
    % save results
    mfcc(:,i)=c1(1:num_dct);
end
% 1st derivative
delta=zeros(size(mfcc));  
for i=3:size(mfcc,2)-2  
    delta(:,i)=-2*mfcc(:,i-2)-mfcc(:,i-1)+mfcc(:,i+1)+2*mfcc(:,i+2);  
end  
% 2nd derivative 
delta2=zeros(size(delta));  
for i=3:size(delta,2)-2  
    delta2(:,i)=-2*delta(:,i-2)-delta(:,i-1)+delta(:,i+1)+2*delta(:,i+2);  
end  

% concatenate
mfcc_feature=[mfcc/3; delta/3; delta2/3];

%plot
figure;
imagesc(mfcc_feature);
colorbar;
title('MFCC');
  