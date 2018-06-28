#pkg install -forge symbolic
#Para instalar o SymPy se precisar: https://github.com/cbm755/octsympy/wiki/Notes-on-Windows-installation
pkg load symbolic;
syms t;
syms tranf;

#degrau normal
x=heaviside(t);
ezplot(t, x);

#-u(t)
transf = -1*t;
x=-heaviside(transf);
ezplot(transf, x);

#u(t+5)
transf = t + 5
x=heaviside(transf);
ezplot(tranf, x);