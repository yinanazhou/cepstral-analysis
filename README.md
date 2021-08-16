## Cepstral Analysis of Audio Signals
### MUMT 605 Final Project

This project introduces the basic concepts of cepstrum and cepstrogram. Their implementations in pitch estimation, spectral envelope estimation, and audio feature extraction are also covered.

#### Matlab

- cepstrum.m is a function that returns the cepstrum of the input.

- main.m calls cepstrum.m and plots the input signal in the time domain, the log spectrum and spectral envelope, and its cepstrum.

- cepstrogram.m is a function that returns the cepstrogram of the input.

- plot_cepstrogram.m calls cepstrogram.m and plots the signal in the time domain and its cepstrogram.

- pitchEstimate.m is a function that estimate pitch using cepstral techniques.

- speech_contrast.m plots the cepstrums of two speech signals and prints the estimated pitch.

- SpecEnvelope.m is a function that returns the spectral envelope of the input.

- plot_enve.m calls SpecEnvelope.m and plots the log spectrum, the spectral envelope and the glottal pulses of the signal.

- plot_mfcc.m plots the mfcc feature of the signal.

- get_pow_2.m is a function that returns the smallest power of two larger than the input.

#### Audio Samples:

- The violin sample is in A4; the trumpet sample is in D#4.

- The speech samples can be downloaded on this website: https://pronunciationstudio.com/45-sounds-ebook/
  
  **Front Vowels** 
  Filename | Vowel
  :-: | :-: 
  1 | /iː/
  2 | /ɪ/
  3 | /e/
  4 | /æ/
  
  **Centre Vowels**
  Filename | Vowel
  :-: | :-: 
  5 | /ə/
  6 | /ɜː/
  7 | /ʌ/
  8 | /ɑː/
  
  **Back Vowels**
  Filename | Vowel
  :-: | :-: 
  9 | /uː/
  10 | /ʊ/
  11 | /ɔː/
  12 | /ɒ/
  
  **Diphthong Vowels**
  Filename | Vowel
  :-: | :-: 
  13 | /eɪ/
  14 | /ɔɪ/
  15 | /aɪ/
  16 | /əʊ/
  17 | /aʊ/
  18 | /ɪə/
  19 | /eə/

