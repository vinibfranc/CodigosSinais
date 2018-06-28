
f0 = 4;
k=8;
ts = 1/k*f0;
 # N = 2*(1/(ts/pi));
# N = 100;
N=k;
n=0:N-1;
x  = 2 * sin(((2*pi)/k)*n);
 plot(n,x)

  
  #somat�rio energia do sinal discretizado
  e = 0; 
  for i = 1:length(x)
    e = e+(x(i))^2;
  end
   #somat�rio potencia do sinal discretizado
  p = 0;
  for i = 1:length(x)
    p = p+(x(i))^2;
  end
  p = p/N;
p
e
  
  #Potencia# O valor da potencia n�o se altera ainda que aumente o numero de amostras (apenas em casas decimais)
           # Isso ocorre pela divis�o do numero da amostra na equa��o potencia, igualando as porpor��es 
  
  #Energia# O valor da energia aumenta quando aumentamos o n�mero de amostras proporcionalmente