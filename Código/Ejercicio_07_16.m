% EJERCICIOS RESUELTOS DE VISIÓN POR COMPUTADOR
% Autores: Gonzalo Pajares y Jesús Manuel de la Cruz
% Copyright RA-MA, 2007
% Ejercicio 7.16: Extracción de bordes, regiones y puntos de interés

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 7.7.10 Regiones: umbrales
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Regiones: Selección de umbral óptimo
clear all;
f =[1 1 2 2 2; 1 8 9 8 1; 2 7 8 9 2; 2 8 9 7 2; 4 4 3 3 3];

[m,n] = size(f);

P = zeros(1,9);

%calculo del histograma
for i=1:1: m
    for j=1:1:n
      P(f(i,j)) = P(f(i,j)) + 1;      
    end
end

T = 5;
% división de los datos en dos lóbulos
h1 = 1; h2 = 1;
for i=1:1:m
    for j=1:1:n
      if f(i,j) < T
          Pp1(h1) = f(i,j);
          h1 = h1 + 1;
      else
          Pp2(h2) = f(i,j);
          h2 = h2 + 1;
      end
    end
end

%calculo de los valores estadísticos de los lóbulos

% probabilidades de ocurrencia de los lóbulos
[a1,a2] = size(Pp1);
[b1,b2] = size(Pp2);

P1 = a2/(m*n);
P2 = b2/(m*n);

%calculo de las medias y desviaciones standard
m1 = mean(Pp1);
m2 = mean(Pp2);

sg1 = std(Pp1);
sg2 = std(Pp2);

%cálculo de los coeficientes de la ecuación de segundo grado
A = sg1^2 - sg2^2;
B = 2*(m1*sg2^2-m2*sg1^2);
C = sg1^2*m2^2-sg2^2*m1^2+2*sg1^2*sg2^2*log10(sg2*P1/sg1*P2);

T1 = (-B + sqrt(B^2-4*A*C))/(2*A);
T2 = (-B - sqrt(B^2-4*A*C))/(2*A);


% detección de las regiones
Regiones = f <= T;

disp('m1: '); disp(m1);
disp('m2: '); disp(m2);
disp('P1: '); disp(P1);
disp('P2: '); disp(P2);
disp('A: '); disp(A);
disp('B: '); disp(B);
disp('C: '); disp(C);

disp('Regiones: '); disp(Regiones);
