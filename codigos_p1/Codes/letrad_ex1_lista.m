f0 = 4;
k=4;
ts = 1/k*f0;
N = 2*(1/(ts/pi));
# N = 100;
n=0:N-1;
x  = 2 * sin(((2*pi)/k)*n);
plot(n,x)

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
  
#Potencia O valor da potencia pouco se altera, pois divide pelo N
#Energia Energia aumenta quando aumentamos numero de amostras