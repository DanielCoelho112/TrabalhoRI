function M = transf(a,x,y)
%Função transf - Rotação pura e translação pura (Transformações homogéneas no plano)
%Argumentos de entrada, a,x, y: Ângulo (em radianos); x e y a translacionar
%Argumento de saída, M: Matriz rotação 3x3
M = [ cos(a) -sin(a) x
      sin(a)  cos(a) y
      0       0      1 ]; 
end