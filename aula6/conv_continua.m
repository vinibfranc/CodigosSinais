pkg load symbolic;
syms tau x t
x=exp(-1*tau)*exp(-2*t+2*tau);
y=int(x,tau,0,t)
y = exp(-2*t)*(exp(t) - 1)