n = 0:20;
xn = cos(n) .* exp(-0.1 * n);
figure(2);
stem(n, xn, 'filled')
hold on
plot(t, xt, ':')
grid on
hold off