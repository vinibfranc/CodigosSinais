f0 = 4;
k=8;
N=k; 
ts = 1/k*f0;
n=0:N-1;
x  = 2 * sin(((2*pi)/k)*n);
plot(n,x)