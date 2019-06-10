%实验要求一：线性预测系数对比
clear all; clc; close all;

[x,fs]=audioread('C3_5_y.wav');    % 读入语音数据
L=240;                                      % 帧长
y=x(8001:8000+L);                   % 取一帧数据
p=50;                                       % LPC的阶数
ar1=lpc(y,p);                            % MATLAB自带函数进行线性预测变换
ar2=lpc_coeff(y,p);                  % 自己编写的函数进行线性预测变换
est_x1=filter([0 -ar1(2:end)],1,y);       % 用LPC求预测估算值
est_x2=filter([0 -ar2(2:end)],1,y);       % 用编写函数求预测估算值
err1=y-est_x1;                            % LPC的预测误差
err2=y-est_x2;                            % 编写函数的预测误差
est_err=est_x1-est_x2;
err_err=err1-err2;

subplot 421; plot(x,'k'); axis tight;ylim([-1 1]);
title('(a)元音/a/波形'); ylabel('幅值')
subplot 422; plot(y,'k'); xlim([0 L]); ylim([-1 1]);
title('(b)一帧数据'); ylabel('幅值')
subplot 423; plot(est_x1,'k'); xlim([0 L]); ylim([-1 1]);
title('(c)LPC预测值'); ylabel('幅值')
subplot 424; plot(est_x2,'k'); xlim([0 L]); ylim([-1 1]);
title('(d)自己编写的lpc\_coeff预测值'); ylabel('幅值')
subplot 425; plot(err1,'k'); xlim([0 L]); ylim([-1 1]);
title('(e)LPC预测误差'); ylabel('幅值'); xlabel('样点')
subplot 426; plot(err2,'k'); xlim([0 L]); ylim([-1 1]);
title('(f)自己编写的lpc\_coeff预测误差'); ylabel('幅值'); xlabel('样点')
subplot 427; plot(est_err,'k'); xlim([0 L]); ylim([-1 1]);
title('(g)两种LPC预测值的差'); ylabel('幅值'); xlabel('样点')
subplot 428; plot(err_err,'k'); xlim([0 L]); ylim([-1 1]);
title('(h)两种LPC预测误差的差'); ylabel('幅值'); xlabel('样点')










