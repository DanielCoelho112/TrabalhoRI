function T = Trans_2D(tx,ty)

%Função transformação homogenea (Translação) em 2D

%Argumentos: tx -- Deslocamento relativamente a x
%            ty -- Deslocamento relativamente a y

%Saida: T -- matriz 2x2 que possibilita a translação


T = [1 0 tx;0 1 ty; 0 0 1];