% EJERCICIOS RESUELTOS DE VISIÓN POR COMPUTADOR
% Autores: Gonzalo Pajares y Jesús Manuel de la Cruz
% Copyright RA-MA, 2007

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 7.7.10 Regiones: umbrales
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Segmentación de regiones método de Ridler-Calvard

clear all; close all
I = imread('Tema05b.bmp','bmp');
A = I(:,:,1);
A = A + 1; % para evitar índices de cero en los arrays


%T = 5; % umbral
L = 256; % numero de niveles de intensidad

[m,n] = size(A);
e = eps; % desviación

P = zeros(1,L);

  for i=1:1: m
      for j=1:1:n
        P(A(i,j)) = P(A(i,j)) + 1;      
      end
  end
  %pi = P/(m*n);
  
  T1 = mean2(A);
  
  %dividir los datos en dos clases: w1 y w2
  h = 1;
  for i=1:1:m
      for j=1:1:n
         if A(i,j) <= T1
            w1(h) = A(i,j);
            h = h + 1;
         end
      end
  end
  
  h = 1;
  for i=1:1:m
      for j=1:1:n
         if A(i,j) > T1
            w2(h) = A(i,j);
            h = h + 1;
         end
      end
  end
  
  m1 = mean(w1);
  m2 = mean(w2);
  
  T2 = (m1 + m2)/2;
  
  iteracion = 0;
  
  while abs(T1-T2)> e
    T1 = T2;
    h = 1;
    for i=1:1:m
        for j=1:1:n
           if A(i,j) <= T1
              w1(h) = A(i,j);
              h = h + 1;
           end
        end
    end
  
    h = 1;
    for i=1:1:m
        for j=1:1:n
           if A(i,j) > T1
              w2(h) = A(i,j);
              h = h + 1;
           end
        end
    end
  
    m1 = mean(w1);
    m2 = mean(w2);
  
    T2 = (m1 + m2)/2; 
    iteracion = iteracion + 1; 
  end
  disp('Valor del umbral final:'); disp(T2) %umbral final
  
subplot(1,2,1); imshow(A-1); title('Imagen Original')

T = (T2-1)/255;
Binaria = im2bw(A-1,T); % los signos - son para corregir la suma por 1 inicial
subplot(1,2,2); imshow(Binaria); title('imagen binarizada T = 101')
  