half_m = 0:ceil(length(X)/2);
stem(half_m*fs/length(X), abs(X(half_m + 1)), 'b');
ylabel('magnitude');
xlabel('frequencia (Hz)'); title('Magnitude da Resposta em Frequencia');