#Potência de sinal discreto
N=6;
n=0:N-1;
x=cos(2*pi*n/N);
P=(1/N)*sum(x.^2)