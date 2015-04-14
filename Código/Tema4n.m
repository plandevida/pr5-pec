%% 5) Operaciones morfológicas
close all; clear all

% Binzarización
A = imread('Tema05b.bmp','bmp');
B = A(:,:,1);

T = graythresh(B);
I = B < 255*T;
clear  A B
figure(1); imshow(I); title('imagen original');

% Dilatación
BW = bwmorph(I,'dilate',1);
figure(2); imshow(BW); title('Dilatada');

% Erosión
BW = bwmorph(I,'erode',1);
figure(3); imshow(BW); title('Erosión');

% Apertura
BW = bwmorph(I,'open',1);
figure(4); imshow(BW); title('Apertura');

% Cierre
BW = bwmorph(I,'close',1);
figure(5); imshow(BW); title('Cierre');

% Bordes
B = bwmorph(I,'open',1) - bwmorph(I,'erode',1);
figure(6); imshow(B); title('Bordes');