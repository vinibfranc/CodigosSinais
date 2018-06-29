ts = 0.25; #periodo
t = 0:ts:20;
expansao = 0.5;
xt = cos(t).*exp(-0.1*(t));  #funcao
xe = cos(t).*exp(-0.1*(expansao*t));  #transformacao
plot(t,xt), grid on;
figure;
plot(t,xe), grid on;