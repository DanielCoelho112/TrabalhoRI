function M = rotz(a)
%Função rotz - Transformação geométrica no espaço a 3D (Rotação em zz)
%Argumento de entrada, a: Ângulo (em radianos)
%Argumento de saída, M: Matriz rotação 4x4
    M = [ cos(a) -sin(a) 0   0
          sin(a)  cos(a) 0   0
          0       0      1   0 
          0       0      0   1  ];
end