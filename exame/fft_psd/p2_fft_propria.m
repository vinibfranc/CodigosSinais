#Butterfly fft and PSD by Vinicius Franceschi

pkg load signal;
function x = my_fft(x)
  
  samples = length(x);
  stages = log2(samples);                                
  if ceil(log2(samples)) != log2(samples) #precisa ser potência de 2
    return
  endif
  for j = 1:stages                                
    for k = 0:2^(stages-j+1):samples-1                   
      for l = 0:2^(stages-j)-1                          #for para o butterfly
        kernel = exp(-i*2*pi*(2^(j-1))*l/samples);      #kernel
        z = (x(l+k+1)-x(l+1+k+2^(stages-j))) * kernel;  #passo 2 da butterfly
        x(l+k+1) = x(l+k+1) + x(l+1+k+2^(stages-j));    #passo 1 da butterfly
        x(l+k+1+2^(stages-j)) = z;
      endfor
    endfor
  endfor
  x = bitrevorder(x); #reversão binária
endfunction

x = load("sinal1.txt");
#x = x';
#PSD com N amostras
x = [x, zeros(1, 2^18-length(x))]; #padding com zeros para ser potência de 2
result = my_fft(x);
m = 0:length(result)/2 -1;
figure(1)
stem(m*40000/length(result), 2/length(result)*abs(result(1:length(result)/2))); #Plot da fft
title("Minha FFT");
psdx1 = (1/(40000*length(result)))*abs(result(1:length(result)/2)).^2;
psdx1(2:end-1) = 2*psdx1(2:end-1);
freq1 = 0:40000/length(result):40000/2-40000/length(result);
ylabel('Magnitude');
figure(2)
plot(freq1, psdx1); #plot da PSD com N amostras
title("Densidade espectral de potência com N amostras");

#PSD com N/2 amostras
result2 = my_fft(x(1:length(x)/2));
m2 = 0:length(result2)/2-1;
figure(3)
psdx2 = (1/(40000*length(result2)))*abs(result2(1:length(result2)/2)).^2;
psdx2(2:end-1) = 2*psdx2(2:end-1);
freq2 = 0:40000/length(result2):40000/2-40000/length(result2);
plot(freq2, psdx2); #plot da PSD com N/2 amostras
title("Densidade espectral de potência com N/2 amostras");

#AMBAS NO MESMO GRÁFICO
figure(4)
plot(freq1, psdx1);
hold on;
plot(freq2, psdx2);