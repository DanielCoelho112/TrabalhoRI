function M = roty(a)
%Fun��o roty - Transforma��o geom�trica no espa�o a 3D (Rota��o em yy)
%Argumento de entrada, a: �ngulo (em radianos)
%Argumento de sa�da, M: Matriz 4x4
    M = [ cos(a)   0       sin(a)    0
          0        1       0         0
          -sin(a)  0       cos(a)    0 
          0        0       0         1  ];
end