function T = Rot_2D(theta)

%Função transformação homogenea (Rotação) em 2D

%Argumentos: theta -- angulo em radianos

%Saida: T -- matriz 2x2 que possibilita a rotação 


T = [cos(theta) -sin(theta) 0;sin(theta) cos(theta) 0; 0 0 1];