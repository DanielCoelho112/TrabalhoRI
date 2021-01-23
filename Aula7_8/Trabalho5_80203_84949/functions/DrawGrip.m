function P = DrawGrip(P_g,h)
    hold on;
%     view(3)
    
    if nargin==1
        
        h(:,:,1) = plot3(P_g(1,1:3),P_g(2,1:3),P_g(3,1:3),'k-','LineWidth',5);
        hold on
        h(:,:,2) = plot3(P_g(1,4:6),P_g(2,4:6),P_g(3,4:6),'k-','LineWidth',5);
        hold on
        h(:,:,3) = plot3(P_g(1,7:9),P_g(2,7:9),P_g(3,7:9),'k-','LineWidth',5);
        
    else
        set(h(:,:,1),'Xdata',P_g(1,1:3),'Ydata',P_g(2,1:3),'Zdata',...
                P_g(3,1:3),'LineWidth',4);
            
        set(h(:,:,2),'Xdata',P_g(1,4:6),'Ydata',P_g(2,4:6),'Zdata',...
                P_g(3,4:6),'LineWidth',4);
            
        set(h(:,:,3),'Xdata',P_g(1,7:9),'Ydata',P_g(2,7:9),'Zdata',...
                P_g(3,7:9),'LineWidth',5);
    end
    
    P = h;

end