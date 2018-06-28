clear all
%Estudo de estacionariedade utilizando o primeiro momento estatístico:
%média
n=100;
N=1:1:n;
for i=1:10 %alterar aqui o número de sinais, i.e, eventos do processo aleatório estacionário

 x1(i,:) = rand(n,1); % rand é qualquer número real de 0 a 1.
 end

for i=1:n

 med(i) = mean(x1(:,i));
end
plot(med)
figure
ribbon(N,x1,0.1) %N tem que ser um vetor com n pontos