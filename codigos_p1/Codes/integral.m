pkg load symbolic
syms x
f = -2*x/(1+x^2)^2;
int(f)