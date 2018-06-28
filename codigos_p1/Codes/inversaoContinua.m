ts = 0.25; #periodo
t = 0:ts:20; #taxa de amostragem
normal = x.^2; 
invertida = -x.^2;
plot(t,normal)
grid on
figure
plot(t,invertida)
grid on