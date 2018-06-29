#dft por Vinicius Franceschi

clear all;

x = [2 2 4 4 6];
N = size(x,2);
xk = zeros(1,N);
ck = zeros(1,N);

kernel = exp((-j*2*pi)/N);
k = 0:N-1;
for k=1:N
   sum = 0;
   for n=1:N
    xn = x(n) * (kernel ^ ((k-1)*(n-1)));
    sum = sum + xn;
   end
    xk(k)= sum;
    ck(k)= (sum * 2) / N;
end

stem(abs(xk));
title("x[k] - 'Amplitude falsa'");
disp("x[k]")
disp(xk)

figure
stem(abs(ck));
title("c[k] - 'Amplitude verdadeira'");
disp("c[k]")
disp(ck)

figure
builtin_fft =  fft(x);
disp("Octave")
disp(builtin_fft);
stem(abs(builtin_fft));
title("FFT feita pelo Octave (equivalente a x[k])");