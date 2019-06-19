clear all;
clc;
[Myaudio Fs]=audioread('1000-4.mp3');
x=0:0.01:10000;
y=sin(x);
Myaudio(1:1000001,2)=y';
audiowrite('Myaudio.wav',Myaudio,Fs);
