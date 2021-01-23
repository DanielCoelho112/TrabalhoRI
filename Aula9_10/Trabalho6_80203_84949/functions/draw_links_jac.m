function [FinalPoint,P]=draw_links_jac(thetas,L,h)

theta1=thetas(1);
theta2=thetas(2);
L1=L(1);
L2=L(2);


DH=[theta1 0 L1 0
    theta2 0 L2 0];
   

for j=1:size(DH,1)
    B_T_W_matriz(:,:,j) = TransLink(DH(j,1),DH(j,2),DH(j,3),DH(j,4));
end


Pontos = zeros(3,1);
Pontos(4,1)=1;
Ref = Pontos;
Matriz = 1;

for k=1:size(B_T_W_matriz,3)
    
    Matriz = Matriz * B_T_W_matriz(:,:,k);
    
     Pontos(:,k+1)=Matriz * Ref;
end



    color={[0,0,0],[0,0,0],[0,0,0],[1,0,0],[1,1,0],[0,1,1],};
    
    if isempty(h)
        
        for j=2:size(Pontos,2)
            h1 = plot3(Pontos(1,j-1:j),Pontos(2,j-1:j),Pontos(3,j-1:j),'LineWidth',4,'Color',color{j});
            h = [h h1];
        end
        
    else
         for j=2:size(Pontos,2)
             set(h(j-1),'XData',Pontos(1,j-1:j),'YData',Pontos(2,j-1:j),'ZData',Pontos(3,j-1:j));
             
         end
    end
   
    P=h;
    FinalPoint=Pontos(1:3,3);
 
end