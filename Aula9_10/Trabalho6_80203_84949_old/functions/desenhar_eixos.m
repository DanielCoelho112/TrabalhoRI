function  desenhar_eixos(P0,B_T_W_matriz)

Px = P0(1,:);
Py = P0(2,:);
Pz = P0(3,:); 

color={[0,0,0],[0,1,0],[0,0,1],[1,0,0],[0.7,1,0.8],[0,1,1],[0.5,0.2,0],[0.7,0.1,1],[1,0.5,1],[0.1,0.4,0.5]};

 h1 = fill3(Px(1:38), Py(1:38), Pz(1:38), 'b', Px(39:end), Py(39:end), Pz(39:end), 'b');

matriz_T = 1;
for i=1:size(B_T_W_matriz,3)
    
    
    
    matriz_T = matriz_T * B_T_W_matriz(:,:,i);
    Novos_Pontos = matriz_T * P0;
    Px = Novos_Pontos(1,:);
    Py = Novos_Pontos(2,:);
    Pz = Novos_Pontos(3,:);
    
   
    
       
    h=fill3(Px(1:38), Py(1:38), Pz(1:38), color{i}, Px(39:end), Py(39:end), Pz(39:end), color{i});

    
    h = [h;h1];
    
    D = h ;
    
  
   
   


end