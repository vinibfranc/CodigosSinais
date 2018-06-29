x = [-2 -1 0 1 2 3 4]
E_tempo= sum(abs(x).^2)
E_freq = sum(abs(fft(x)).^2)/length(x)