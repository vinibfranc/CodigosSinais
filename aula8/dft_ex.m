x = [2 2 4 4 6 6];
Xsize = length(x);
for k=0:Xsize-1

 mysumm = 0;
 for n=0:Xsize-1

 mysumm = mysumm + x(n+1)*(cos(2*pi*n*k/Xsize)-
j*sin(2*pi*n*k/Xsize));
 end
 X(k+1) = mysumm;
end
Xmag = abs(X);
Xphase = angle(X);

plot(Xmag);
title("Magnitude");
figure;
plot(Xphase);
title("Fase");