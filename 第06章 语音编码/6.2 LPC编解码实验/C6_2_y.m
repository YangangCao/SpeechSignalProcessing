%实验要求一：LPC编解码实验
clc
close all
clear all
[x,fs]=audioread('C6_2_y.wav');     
LENGTH=length(x);                          
n=0:1/fs:(LENGTH-1)/fs;   

% --------------------------------------- %
% 原始语音信号 %
subplot(3,1,1),plot(n*1000, x),grid;
xlabel('Time/s');    ylabel('Amplitude');
title('Original Signal')

% 简单编解码显示 %
subplot(3,1,2)
order=20;    % 阶数
[a,g]=lpc(x,order);   % 预测系数
error = filter(a,1,x);  % 预测误差
plot(n*1000,error,'r'),grid;
xlabel('Time/s');    ylabel('Amplitude');
title('Predictive Error')

% --------------------------------------- %
% est_x=filter([0 -a(2:end)],1,x); % 也可以这么算
est_x = filter(1,a,error);    % 预测信号
subplot(3,1,3),plot(n*1000,est_x), grid;
xlabel('Time/s');    ylabel('Amplitude');
title('Predictive Signal')
