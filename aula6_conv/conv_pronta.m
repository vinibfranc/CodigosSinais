n1=-5:5;
n2=n1;
x1=[0 0 0 2 0 3 0 2 0 0 0];
x2=[0 0 0 0 0 5 -1 -2 3 0 0];
nm=n1(1)+n2(1);
nM=n1(length(n1))+n2(length(n2));
n=nm:nM;
y=conv(x1,x2)