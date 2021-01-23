function D = desenhar_eixos(P0,B_T_W_matriz)

Px = P0(1,:);
Py = P0(2,:);
Pz = P0(3,:); 



h = fill3(Px(1:38), Py(1:38), Pz(1:38), 'b', Px(39:end), Py(39:end), Pz(39:end), 'b');

matriz_T = 1;
for i=1:size(B_T_W_matriz,3)
    
    matriz_T = matriz_T * B_T_W_matriz(:,:,i);
    Novos_Pontos = matriz_T * P0;
    Px = Novos_Pontos(1,:);
    Py = Novos_Pontos(2,:);
    Pz = Novos_Pontos(3,:);
    
    
    if i==4
        
        h1 = fill3(Px(1:38), Py(1:38), Pz(1:38), 'g', Px(39:end), Py(39:end), Pz(39:end), 'g');
    else
        h1 = fill3(Px(1:38), Py(1:38), Pz(1:38), 'b', Px(39:end), Py(39:end), Pz(39:end), 'b');
    end
    
    h = [h;h1];
    
    D = h ;


end