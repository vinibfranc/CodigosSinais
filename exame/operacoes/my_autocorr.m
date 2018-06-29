#Autocorrelacao cruzada por Vinicius Franceschi

clear all;
pkg load signal;
#Solicita digitacao dos dois sinais
#x = input("Digite o sinal para autocorrelacionar: ");
x = [2 3 3 2 1 1.5 1.5];

#Guarda a quantidade de elementos de cada sinal digitado
len_x = size(x,2);
len_h = size(x,2);

#O tamanho do array resultante sera a soma das dimensoes dos sinais menos 1
len_result = len_x + len_h - 1;
result = zeros(1, len_result);
len = size(result,2);
range = 1:len_result;

for i = 1:len 
   
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
      result(i) = result(i) + x(arg + j) * x(j);
    else
      result(i) = result(i) + x(j) * x(j - arg);
    end
  end
end

disp("Resultado da minha autocorrelacao")
disp(result)
stem(range,result)
title("Minha autocorrelacao")

figure
builtin_autocorr = xcorr(x,x);
disp("Autocorrelacao feita pelo Octave")
disp(builtin_autocorr)
stem(builtin_autocorr)
title("Autocorrelacao do Octave")
