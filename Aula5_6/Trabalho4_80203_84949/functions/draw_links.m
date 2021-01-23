function P=draw_links(Pontos,h)

    color={[0,0,0],[0,1,0],[0,0,1],[1,0,0],[1,1,0],[0,1,1],};
    
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
 
end