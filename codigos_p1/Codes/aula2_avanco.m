ts = 0.25; #periodo
t = 0:ts:20;
avanco = 20;
xt = cos(t).*exp(-0.1*(t));  #funcao
xa = cos(t).*exp(-0.1*(t-avanco));  #transformacao
plot(t,xt), grid on;
figure;
plot(t,xa), grid on;