clear all;
% Dependencia: pacote signal
%pkg install -forge signal;
pkg load signal;

%carrega arquivo e plota o sinal (cerca de 10 ciclos)
ecg = load('ECG.txt');
plot(ecg);
title ("Sinal de ECG com 10 ciclos");
axis([0 10000 -5 15]);

figure;

[peaks, index] = findpeaks(ecg, 'DoubleSided', 'MinPeakHeight', 10);

for i=4:4:length(peaks)-4
  media(i/4) = mean(ecg(index(i):index(i+4)));
  desvio(i/4) = std(ecg(index(i):index(i+4)));
  variancia(i/4) = desvio(i/4)*desvio(i/4);
end

plot(media);
title ("Média");

figure;

plot(desvio);
title ("Desvio-padrão");

figure;
plot(variancia);
title ("Variância");