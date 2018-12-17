%Assigment 5
close all
[y, fs] = audioread('corrupted_voice.wav');
%sound(y,fs);

ydft = fft(y);
% I'll assume y has even length
ydft_sample = ydft(1:length(y)/2+1);
% create a frequency vector
freq = 0:fs/length(y):fs/2;
% plot magnitude
subplot(211);
plot(freq,abs(ydft_sample));
% plot phase
subplot(212);
plot(freq,unwrap(angle(ydft_sample))); 
xlabel('Hz');


[b,a] = butter(5,[250 1200]/(fs/2));
figure
freqz(b,a)
y_filtered = filter(b,a,y);
ydft_filtered = fft(y_filtered);
% I'll assume y has even length
ydft_filtered_sample = ydft_filtered(1:length(ydft_filtered)/2+1);

figure
% plot magnitude
subplot(211);
plot(freq,abs(ydft_filtered_sample));
% plot phase
subplot(212);
plot(freq,unwrap(angle(ydft_filtered_sample))); 
xlabel('Hz');

y_filtered = real(ifft(ydft_filtered));

sound(y_filtered,fs);
audiowrite('voice.wav',y_filtered,fs);