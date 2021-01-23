function M=rot(a)
%Função rot - Apresenta a matriz de rotação em 2D.
%Argumento de entrada, a: Ângulo (em radianos)
%Argumento de saída, M: Matriz rotação 2x2
M = [cos(a) -sin(a)
     sin(a)  cos(a)]; 
end