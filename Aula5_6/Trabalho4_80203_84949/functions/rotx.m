function M = rotx(a)
%Função rotx - Transformação geométrica no espaço a 3D (Rotação em xx)
%Argumento de entrada, a: Ângulo (em radianos)
%Argumento de saída, M: Matriz 4x4
    M = [ 1      0         0         0
          0      cos(a)   -sin(a)    0
          0      sin(a)    cos(a)    0 
          0      0         0         1  ];
end