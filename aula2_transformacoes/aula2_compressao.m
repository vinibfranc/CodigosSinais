ts = 0.25; #periodo
t = 0:ts:20;
compressao = 2;
xt = cos(t).*exp(-0.1*(t));  #funcao
xc = cos(t).*exp(-0.1*(compressao*t));  #transformacao
plot(t,xt), grid on;
figure;
plot(t,xc), grid on;