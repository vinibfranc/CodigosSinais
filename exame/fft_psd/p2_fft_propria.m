disp("Calculando...")
pkg load signal
function x = myfft(x)
  N = length(x);
  ST = log2(N);                                #Stages da fft
  if ceil(log2(N)) != log2(N)                  #Parar o código caso o vetor não seja potência de 2
    return
  endif
  for j = 1:ST                                 #For dos stages
    for k = 0:2^(ST-j+1):N-1                   #For com passo variável
      for l = 0:2^(ST-j)-1                     #For para o butterfly
        Wn = exp(-i*2*pi*(2^(j-1))*l/N);       #Cálculo do kernel W
        z = (x(l+k+1)-x(l+1+k+2^(ST-j)))*Wn;   #Step 2 da butterfly
        x(l+k+1) = x(l+k+1)+x(l+1+k+2^(ST-j)); #Step 1 da butterfly
        x(l+k+1+2^(ST-j)) = z;
      endfor
    endfor
  endfor
  x = bitrevorder(x);                          #Reversão binária
endfunction

x = load("sinal1.txt");
x = x';
x = [x, zeros(1, 2^18-length(x))]; #Padding com zeros para chegar num vetor com comprimento potência de 2
X = myfft(x);
m = 0:length(X)/2-1;
figure(1)
stem(m*40000/length(X), 2/length(X)*abs(X(1:length(X)/2))); #Plot da fft
title("Minha FFT");
psdx1 = (1/(40000*length(X)))*abs(X(1:length(X)/2)).^2;
psdx1(2:end-1) = 2*psdx1(2:end-1);
freq1 = 0:40000/length(X):40000/2-40000/length(X);
ylabel('Magnitude');
figure(2)
plot(freq1, 10*log10(psdx1)); #Plot da densidade espectral com N amostras
title("Densidade espectral de potência com N amostras");
X2 = myfft(x(1:length(x)/2));
m2 = 0:length(X2)/2-1;
figure(3)
psdx2 = (1/(40000*length(X2)))*abs(X2(1:length(X2)/2)).^2;
psdx2(2:end-1) = 2*psdx2(2:end-1);
freq2 = 0:40000/length(X2):40000/2-40000/length(X2);
plot(freq2, psdx2); #Plot da densidade espectral com N/2 amostras
title("Densidade espectral de potência com N/2 amostras");
figure(4)
plot(freq1, psdx1);
hold on; #Plot de ambas no mesmo gráfico
plot(freq2, psdx2);