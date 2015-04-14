% EJERCICIOS RESUELTOS DE VISIÓN POR COMPUTADOR
% Autores: Gonzalo Pajares y Jesús Manuel de la Cruz
% Copyright RA-MA, 2007
% Ejercicio 7.17: Extracción de bordes, regiones y puntos de interés

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 7.7.10 Regiones: umbrales
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Segmentación de regiones método de Otsu
clear all;
A =[1 1 2 2 2; 1 8 9 8 1; 2 7 8 9 2; 2 8 9 7 2; 4 4 3 3 3];

T = 5; % umbral
L = 9; % numero de niveles de intensidad

[m,n] = size(A);

P = zeros(1,9);

  for i=1:1: m
      for j=1:1:n
        P(A(i,j)) = P(A(i,j)) + 1;      
      end
  end

for T=1:1:L
  w1 = 0; w2 = 0;
  for i=1:1:T
   w1 = w1 + P(i);
  end

  for i=T+1:1:L
   w2 = w2 + P(i);
  end

  % calculo de las medias
  m1 = 0; m2 = 0;
  for i=1:1:T
   m1 = m1 + i*P(i)/w1;
  end

  for i=T+1:1:L
   m2 = m2 + i*P(i)/w2;
  end

  % calculo de las varianzas
  v1 = 0; v2 = 0;
  for i=1:1:T
   v1 = v1 + ((i-m1)^2)*(P(i)/w1);
  end

  for i=T+1:1:L
   v2 = v2 + ((i-m2)^2)*(P(i)/w2);
  end

  sg = w1*v1 + w2*v2;
  
  V(T) = sg;
end

disp('Varianza de w: '); disp(V);
