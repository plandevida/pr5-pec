% EJERCICIOS RESUELTOS DE VISIÓN POR COMPUTADOR
% Autores: Gonzalo Pajares y Jesús Manuel de la Cruz
% Copyright RA-MA, 2007
% Ejercicio 7.18: Extracción de bordes, regiones y puntos de interés

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 7.7.10 Regiones: umbrales
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Segmentación de regiones método de Ridler-Calvard

clear all;
A =[1 1 2 8 8; 2 2 3 8 8; 3 3 4 8 9; 3 3 7 7 9; 4 4 7 9 9];

%T = 5; % umbral
L = 9; % numero de niveles de intensidad

[m,n] = size(A);
e = eps; % desviación

P = zeros(1,9);

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
  disp('Valor del umbral final:'); T2 %umbral final
  