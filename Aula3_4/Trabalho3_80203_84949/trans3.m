function M = trans3(x,y,z)
%Função trans3 - Transformação geométrica no espaço a 3D (Translação)
%Argumento de entrada, x,y,z: translação pretendida em cada um dos 3 eixos
%Argumento de saída, M: Matriz 4x4
    M = [ 1      0       0       x
          0      1       0       y
          0      0       1       z 
          0      0       0       1  ];
end