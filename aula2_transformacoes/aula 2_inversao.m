ts = 0.25; #periodo
t = 0:ts:20;
xt = cos(t).*exp(-0.1*(t));  #funcao
xi = cos(t).*exp(-0.1*((-1)*t));  #transformacao
plot(t,xt), grid on;
figure;
plot(t,xi), grid on;