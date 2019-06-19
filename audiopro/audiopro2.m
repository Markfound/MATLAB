clear all;
clc;
[Myaudio Fs]=audioread('Myvoice.mp3');
x=0:0.1:60000;
y=Myaudio(10000:610000,1)';

plot(x,y);