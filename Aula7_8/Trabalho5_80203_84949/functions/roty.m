function M = roty(a)
%Função roty - Transformação geométrica no espaço a 3D (Rotação em yy)
%Argumento de entrada, a: Ângulo (em radianos)
%Argumento de saída, M: Matriz 4x4
    M = [ cos(a)   0       sin(a)    0
          0        1       0         0
          -sin(a)  0       cos(a)    0 
          0        0       0         1  ];
end