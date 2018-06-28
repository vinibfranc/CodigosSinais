Ts=pi/5; #periodo de amostragem (relativo a n*Ts)

N=2*(1/(Ts/pi)); #Busca o Total de amostras pelo Ts 
n = 0:(N-1);

x = cos(n*Ts); #funçao
x_str=(['cos(n*pi/',num2str(N/2),')']); 

#Energia
energia = 0; 
for i = 1:length(x)
  energia = energia+(x(i))^2;
end

#Potencia
pot = 0; 
for i = 1:length(x)
  pot = pot+(x(i))^2;
end
pot = pot/N;

#Graficos
stem(x); 
title(x_str); 
xlabel(['Potencia: ',num2str(pot),' | Energia Total: ',num2str(energia)]);
