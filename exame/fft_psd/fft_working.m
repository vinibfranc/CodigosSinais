#Butterfly fft and PSD by Vinicius Franceschi

pkg load signal
function x = myfft(x)
  N = length(x);
  ST = log2(N);               
  if ceil(log2(N)) != log2(N) #precisa ser potência de 2
    return
  endif
  for j = 1:ST                
    for k = 0:2^(ST-j+1):N-1    
      for l = 0:2^(ST-j)-1                     #for para o butterfly
        Wn = exp(-i*2*pi*(2^(j-1))*l/N);       #kernel
        z = (x(l+k+1)-x(l+1+k+2^(ST-j)))*Wn;   #passo 2 da butterfly
        x(l+k+1) = x(l+k+1)+x(l+1+k+2^(ST-j)); #passo 1 da butterfly
        x(l+k+1+2^(ST-j)) = z;
      endfor
    endfor
  endfor
  x = bitrevorder(x); #reversão binária
endfunction

x = load("sinal1.txt");
x = x';
x = [x, zeros(1, 2^18-length(x))]; #padding com zeros para ser potência de 2
X = myfft(x);
m = 0:length(X)/2-1;
figure(1)
stem(m*40000/length(X), 2/length(X)*abs(X(1:length(X)/2))); #plot
title("Minha FFT")

#PSD com N amostras
psdx1 = (1/(40000*length(X)))*abs(X(1:length(X)/2)).^2;
psdx1(2:end-1) = 2*psdx1(2:end-1);
freq1 = 0:40000/length(X):40000/2-40000/length(X);
ylabel('Magnitude');
figure(2)
plot(freq1, psdx1); #Plot da PSD com N amostras
title("Densidade espectral de potência com N amostras");

#PSD com N/2 amostras
X2 = myfft(x(1:length(x)/2));
m2 = 0:length(X2)/2-1;
figure(3)
psdx2 = (1/(40000*length(X2)))*abs(X2(1:length(X2)/2)).^2;
psdx2(2:end-1) = 2*psdx2(2:end-1);
freq2 = 0:40000/length(X2):40000/2-40000/length(X2);
plot(freq2, psdx2); #plot da PSD com N/2 amostras
title("Densidade espectral de potência com N/2 amostras");

#AMBAS NO MESMO GRÁFICO
figure(4)
plot(freq1, psdx1);
hold on; 
plot(freq2, psdx2);