n = 0:20; #amostras
xn = cos(n).*exp(-0.1*n); 
figure(2);
stem(n,xn,'filled')
hold on
#plot(t,xt,':'); #t � cont�nua plotada em cima do discreto
grid on
hold off