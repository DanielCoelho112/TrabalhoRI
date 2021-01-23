function M = transf(a,x,y)
%Fun��o transf - Rota��o pura e transla��o pura (Transforma��es homog�neas no plano)
%Argumentos de entrada, a,x, y: �ngulo (em radianos); x e y a translacionar
%Argumento de sa�da, M: Matriz rota��o 3x3
M = [ cos(a) -sin(a) x
      sin(a)  cos(a) y
      0       0      1 ]; 
end