function M = rotz(a)
%Fun��o rotz - Transforma��o geom�trica no espa�o a 3D (Rota��o em zz)
%Argumento de entrada, a: �ngulo (em radianos)
%Argumento de sa�da, M: Matriz rota��o 4x4
    M = [ cos(a) -sin(a) 0   0
          sin(a)  cos(a) 0   0
          0       0      1   0 
          0       0      0   1  ];
end