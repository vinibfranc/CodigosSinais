#FFT por Vinicius Franceschi

clear all;
x = input('Entre com o sinal para realizar a FFT: ');
N = length(x); 

for k = 1:N #para cada valor de k
  y(k) = 0; 
  for n = 1:N #para cada valor de n
    y(k) = y(k)+x(n)*exp(-1i*2*pi*(k-1)*(n-1)/N); 
  end
end

t = 0:N-1;
subplot(3,1,1);
stem(t,x); #Plotagem discreta

ylabel('Amplitude');
xlabel('n');
title('Entrada');

magnitude = abs(y); #Valores absolutos individuais 
disp('FFT : ');
disp(magnitude);

#Plotagem da sequencia
t=0:N-1;
subplot(3,1,2);
stem(t,magnitude);
ylabel('Amplitude');
xlabel('K');
title('FFT');

builtin_fft = fft(x);
disp(builtin_fft)