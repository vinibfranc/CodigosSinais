N=50; %Número de amostras no gráfico.
fo = 2; %frequência do sinal x
Ts=1/40;
n=0:N-1;
x=cos(2*pi*fo*n*Ts);
fu = 10; %frequência do sinal u
Tu = 1/100;
u=cos(2*pi*fu*n*Tu);
mediax = mean(x)
varianciax = var(x)
mediau = mean(u)
varianciau = var(u)
y=xcorr(x);
plot(y)
hold on
w=xcorr(u);
plot(w)
Px=(1/N)*sum(x.^2)
Ex=sum(x.^2)
Pu=(1/N)*sum(u.^2)
Eu=sum(u.^2)