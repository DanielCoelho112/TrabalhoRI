function M = trans3(x,y,z)
%Fun��o trans3 - Transforma��o geom�trica no espa�o a 3D (Transla��o)
%Argumento de entrada, x,y,z: transla��o pretendida em cada um dos 3 eixos
%Argumento de sa�da, M: Matriz 4x4
    M = [ 1      0       0       x
          0      1       0       y
          0      0       1       z 
          0      0       0       1  ];
end