function Pontos = points_links(B_T_W_matriz)

Pontos = zeros(3,1);
Pontos(4,1)=1;
Ref = Pontos;
Matriz = 1;

for k=1:size(B_T_W_matriz,3)
    
    Matriz = Matriz * B_T_W_matriz(:,:,k);
    
     Pontos(:,k+1)=Matriz * Ref;
end



end
