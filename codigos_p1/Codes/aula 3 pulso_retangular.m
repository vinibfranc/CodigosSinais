#pkg load signal
#Pulso Retangular
t1 =-10:1:-4;
t2=-4:1:4;
t3=4:1:10;
t=[t1 t2 t3];
x1 = zeros(size(t1));
x2 = ones(size(t2))*1.5;
x3 = zeros(size(t3));

x = [x1 x2 x3];
plot (t,x);
ylim([-0.5 2]);