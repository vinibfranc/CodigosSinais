#Correlacao cruzada por Vinicius Franceschi

clear all;
pkg load signal;
#Solicita digitacao dos dois sinais
#x = input("Digite o primeiro sinal discreto: ");
#h = input("Digite o segundo sinal discreto: ");
x = [2 3 3 2 1 1.5 1.5];
h = [0.5 0.3 0.2 0 0 0 0];

#Guarda a quantidade de elementos de cada sinal digitado
len_x = size(x,2);
len_h = size(h,2);

#O tamanho do array resultante sera a soma das dimensoes dos sinais menos 1
len_result = len_x + len_h - 1;
result = zeros(1, len_result);
len = size(result,2);
range = 1:len_result;

for i = 1 : len 
   
  arg = (i - len_x); 
  if(arg < 0)
    negative_condition = 1;
    limit = len_x + arg;
  else
    negative_condition = 0;
    limit = len_x - arg;
  end

  for j = 1:limit
    if(negative_condition == 0)
      result(i) = result(i) + x(arg + j) * h(j);
    else
      result(i) = result(i) + x(j) * h(j - arg);
    end
  end
end

#Mostra no terminal os resultados e plota o grafico discreto do sinal resultante
disp("Resultado da minha correlacao")
disp(result)
stem(range,result)
title("Minha correlacao")

figure
builtin_corr = xcorr(x,h);
disp("Correlacao feita pelo Octave")
disp(builtin_corr)
stem(builtin_corr)
title("Correlacao do Octave")
