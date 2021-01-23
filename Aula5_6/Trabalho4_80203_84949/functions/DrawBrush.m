function P = DrawBrush (P_g,h)
    hold on;
    
    if nargin==1
        
        h(:,:,1) = plot3(P_g(1,1:2),P_g(2,1:2),P_g(3,1:2),'LineWidth',6,'Color','#669999');
        hold on
        h(:,:,2) = plot3(P_g(1,3:4),P_g(2,3:4),P_g(3,3:4),'LineWidth',4,'Color','#666666');
        hold on
        a=5;b=6;
        for i=3:21
            h_int = plot3(P_g(1,a:b),P_g(2,a:b),P_g(3,a:b),'LineWidth',1,'Color','#ffd966');
            h(:,:,i) = h_int;
            a=a+2; b=b+2;
            hold on
        end
        
        
    else
        set(h(:,:,1),'Xdata',P_g(1,1:2),'Ydata',P_g(2,1:2),'Zdata',...
                P_g(3,1:2),'LineWidth',4);
            
        set(h(:,:,2),'Xdata',P_g(1,4:5),'Ydata',P_g(2,4:5),'Zdata',...
                P_g(3,4:5),'LineWidth',4);
        a=5;b=6; 
        for i=3:21    
            set(h(:,:,i),'Xdata',P_g(1,a:b),'Ydata',P_g(2,a:b),'Zdata',...
                    P_g(3,a:b),'LineWidth',5);
            a=a+2; b=b+2;
        end 
    end
    
    P = h;

end