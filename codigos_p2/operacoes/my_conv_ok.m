#Convolucao por Vinicius Franceschi

clear all;

#x = input('Digite o primeiro sinal: ');
#h = input('Digite o segundo sinal: ');
x = [2 3 3 2 1 1.5 1.5];
h = [0.5 0.3 0.2 0 0 0 0];

len_x = length(x);
len_h = length(h);
padd_x = [x,zeros(1,len_x)];                     
padd_h = [h,zeros(1,len_h)]; 
                
for i=1:len_x+len_x-1
    result(i)=0;
    for j=1:i
        result(i) = result(i) + padd_x(j) * padd_h(i-j+1);
    end
end

#Mostra no terminal os resultados e plota o grafico discreto do sinal resultante
disp("Minha convolucao")
disp(result)
stem(result);
title('Minha convoluçao');

figure
builtin_conv = conv(x,h);
disp("Convolucao feita pelo Octave")
disp(builtin_conv)
stem(builtin_conv)
title('Convolucao do Octave');