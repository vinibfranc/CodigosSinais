n1=0:2;
x1=[2 2 -1];
n2=0:3;
x2=[4 3 2 1];
nm=n1(1)+n2(1);
nM=n1(length(n1))+n2(length(n2));
n=nm:nM
y=conv(x1,x2)
stem(n,y,'filled')
grid on