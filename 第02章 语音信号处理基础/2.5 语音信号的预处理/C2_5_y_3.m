% 实验要求三：预加重功能测试
clc
clear all
close all
[s,fs]=audioread('C2_5_y_3.wav');
e=s(2000:2225); %提取一段进行分析，容易看出变化
un=filter([1,-0.95],1,e); %预加重信号b=[1,-0.95];

%原始信号频谱
N=512;
pinlv=(0:1:N/2-1)*fs/N;
x=fft(e,N);
r1=abs(x);
t1=20*log10(r1);
signal=t1(1:N/2);

%预加重信号频谱
% fisrt way
%[h1,w1]=freqz([1,-0.95],1,256,fs);
%r2=r1(1:N/2);
%u=r2.*h1;
%u2=abs(u);
%signalPre=20*log10(u2);

% second way
xPre=fft(un,N);
r2=abs(xPre);
t2=20*log10(r2);
signalPre=t2(1:N/2);

figure(1);
subplot(211)
plot(e,'b*-')
ylim([-0.4,1])
hold on
plot(real(un),'ro-')
legend('Original Signal','Pre-emphasising Sginal')
title('Original and Pre-emphasis Signal');
xlabel('Sample Point');ylabel('Amplitude');
subplot(212);
plot(pinlv,signal,'g+-')
hold on
plot(pinlv,signalPre,'kx-')
legend('Original Signal','Pre-emphasising Sginal')
title('Frequency Spectrum of Original and Pre-emphasis Signal');
xlabel('Frequency');ylabel('Amplitude/dB');

