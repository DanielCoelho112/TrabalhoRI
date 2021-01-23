function M = rotx(a)
%Fun��o rotx - Transforma��o geom�trica no espa�o a 3D (Rota��o em xx)
%Argumento de entrada, a: �ngulo (em radianos)
%Argumento de sa�da, M: Matriz 4x4
    M = [ 1      0         0         0
          0      cos(a)   -sin(a)    0
          0      sin(a)    cos(a)    0 
          0      0         0         1  ];
end