N = 10;
fo = 45;
Ts = 1/90;
n=0:N-1;
x = cos(2 * pi * fo * n * Ts);
stem(n, x) 