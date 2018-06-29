ts = 0.1;
t = 0:ts:20;
xt = cos(t) .* exp(-0.1*t);
plot(t, xt), grid on