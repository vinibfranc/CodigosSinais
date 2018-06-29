#Convolu��o por Vin�cius Franceschi

clear all;
#Solicita digita��o dos dois sinais
x = input("Digite o primeiro sinal discreto (em forma de vetor): ");
h = input("Digite o segundo sinal discreto (em forma de vetor): ");

#Guarda a quantidade de elementos de cada sinal digitado
len_x = length(x);
len_h = length(h);

#O tamanho do array resultante ser� a soma das dimens�es dos sinais menos 1
n = len_x + len_h - 1;                      
result = zeros(1,n);
range = 1:n;

for i = 0:n
  for j = 0:n
   if ((i-j+1) > 0 && (i-j+1) <= len_h && (j+1) < len_x)
    result(i+1) = result(i+1) + x(j+1) .* h(i-j+1);
   end
  end
end

#Mostra no console o resultado da convolu��o e plota o sinal discreto
disp("Resultado da minha convolucao")
disp(result)
stem(range, result)

#Compara��o com a fun��o conv do Octave para mostrar que resultado est� correto
figure
builtin_conv = conv(x,h);
disp("Convolucao feita pelo Octave")
disp(builtin_conv)
stem(builtin_conv)