% Autores: Daniel Serrano Torres, Emilio Álvarez Piñeiro
% Práctica 05
clear all; close all;
%%

I = imread('Tema05b.bmp','bmp')

R = I(:,:,1)

figure(1);
subplot(2,2,1); imshow(I); title('original');
subplot(2,2,2); imshow(R); title('componente roja');
subplot(2,2,3); imhist(R); title('histograma componente roja');

%% 1-a Binarización

clear all;
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

T = (T2-1)/255;
Binaria = im2bw(A-1,T); % los signos - son para corregir la suma por 1 inicial
subplot(2,2,4); imshow(Binaria); title('imagen binarizada T = 100')

%% 1-b Binarización con humbral automático
clear all;

% Binzarización
A = imread('Tema05b.bmp','bmp');
B = A(:,:,1);

T = graythresh(B);
I = B < 255*T;
Binaria = im2bw(A-1,T);

figure(2);
subplot(1,3,1); imshow(A); title('imagen original');
subplot(1,3,2); imshow(I); title('binarizada T automático');
subplot(1,3,3); imshow(Binaria); title('binairizada con im2bw');
clear  A B
disp('Valor del umbral final:'); disp(T*255)

%% 2-a Etiquetado de componenetes conexas

[Etiquetas, N] = bwlabel(I, 8);

figure(3);
subplot(2,2,1); imshow(Etiquetas); impixelinfo; title('Etiquetas');
%
%% 2-b Etiquetado de componenetes conexas
[m,n] = size(Etiquetas);
for i=1:1:m
        for j=1:1:n
            if Etiquetas(i,j) == 1
             Etiquetas(i,j) = N+1;
            end
        end
end
figure(4);
subplot(2,2,1);imagesc(Etiquetas);colorbar;
%
%% 3-a Etiquetado de componenetes conexas
clear all;

A = imread('Tema05b.jpg','jpg');

Rr = A(1:4:end,1:4:end,[1 2 3 ]);
Rojo = Rr(:,:,1);
Azul = Rr(:,:,2);
Verde = Rr(:,:,3);

Size = size(Rojo);

RR = zeros(Size);
BR = zeros(Size);
GR = zeros(Size);

T = 70;

[m,n] = size(RR);
for i=1:1:m
    for j=1:1:n
        if Rojo (i,j) > T && (Rojo(i,j) > Verde(i,j)) && (Rojo(i,j) > Azul(i,j))
            RR(i,j) = 255;
        end
        if Azul (i,j) > T && (Azul(i,j) > Verde(i,j)) && (Rojo(i,j) < Azul(i,j))
            BR(i,j) = 255;
        end
        if Verde (i,j) > T && (Rojo(i,j) < Verde(i,j)) && (Verde(i,j) > Azul(i,j))
            GR(i,j) = 255;
        end
    end
end

figure(5);
subplot(1,3,1); imshow(RR); title('RR');
subplot(1,3,2); imshow(GR); title('GR');
subplot(1,3,3); imshow(BR); title('BR');
%
%% 4-a Etiquetado de componenetes conexas
clear all;
% Binzarización
A = imread('Tema05b.bmp','bmp');
B = A(:,:,1);

T = graythresh(B);
I = B < 255*T;
clear  A B
figure(6);
subplot(2,3,1); imshow(I); title('imagen binarizada');

% Dilatación
BW = bwmorph(I,'dilate',1);
subplot(2,3,2);imshow(BW); title('Dilatada');

% Erosión
BW = bwmorph(I,'erode',1);
subplot(2,3,3); imshow(BW); title('Erosión');

% Apertura
BW = bwmorph(I,'open',1);
subplot(2,3,4); imshow(BW); title('Apertura');

% Cierre
BW = bwmorph(I,'close',1);
subplot(2,3,5);imshow(BW); title('Cierre');

% Bordes
B = bwmorph(I,'open',1) - bwmorph(I,'erode',1);
subplot(2,3,6); imshow(B); title('Bordes');

%% 5-a Opcional
clear all;

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

figure(7)
subplot(1,2,1); imshow(A-1); title('Componente roja')

T = (T2-1)/255;
Binaria = im2bw(A-1,T); % los signos - son para corregir la suma por 1 inicial
subplot(1,2,2); imshow(Binaria); title('imagen binarizada')

%% 5-b Opcionales

N = Inf;
B = bwmorph(Binaria,'bothat',N);
figure(8);
subplot(2,2,1); imshow(B); title('bothat');

C = bwmorph(Binaria,'skel',N);
subplot(2,2,2); imshow(C); title('skel');

V = bwmorph(Binaria,'thin',N);
subplot(2,2,3); imshow(V); title('thin');

G = bwmorph(Binaria,'shrink',N);
subplot(2,2,4); imshow(G); title('srink');