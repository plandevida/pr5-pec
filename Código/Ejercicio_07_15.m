% EJERCICIOS RESUELTOS DE VISIÓN POR COMPUTADOR
% Autores: Gonzalo Pajares y Jesús Manuel de la Cruz
% Copyright RA-MA, 2007
% Ejercicio 7.15: Extracción de bordes, regiones y puntos de interés

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 7.7.10 Regiones: umbrales
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Regiones: Binarización de umbral

f =[1 1 2 2 2; 1 8 9 8 1; 2 7 8 9 2; 2 8 9 7 2; 4 4 3 3 3];

[m,n] = size(f);

P = zeros(1,9);

%calculo del histograma
for i=1:1: m
    for j=1:1:n
      P(f(i,j)) = P(f(i,j)) + 1;      
    end
end

% diagrama de barras del histograma
bar(1:1:9,P)

% valor del umbral
T = 5;

% detección de las regiones
Regiones = f <= T;

disp('Regiones: '); disp(Regiones);