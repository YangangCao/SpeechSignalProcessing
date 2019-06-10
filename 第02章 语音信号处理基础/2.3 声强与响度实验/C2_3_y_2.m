%实验要求二：绘制声压级曲线
%编写函数实现式（2-4），要求可以输入任意非负响度级时，可得到该响度级对应的声压级曲线，并使用plot函数完成曲线的显示。
clc
clear all
figure(1)

for phon = [0,10,20,30,40,50,60,70,80,90]
	[spl,freq]=iso226(phon);                    %计算声压级
	semilogx(freq,spl,'color','k')
	title('Equal-loudness Contours')
	xlabel('Frequency(Hz)')
	ylabel('Sound Pressure Level(dB)')
	axis([20,20000,-10,130])
	set(gca,'ytick',-10:10:130)
	grid on
	box off
	hold on 
end