function P = DrawLinks(Orig,h)
    hold on;
%     view(3)
    
    colors = ["#d9d9d9", "#bfbfbf", "#999999", "#737373","#4d4d4d"];
    if nargin==1
        for i=1:(size(Orig,2)-1)
            h_int = plot3(Orig(1,i:i+1),Orig(2,i:i+1),Orig(3,i:i+1),'LineWidth',5,'Color',colors(i));
            h(:,:,i) = h_int;
        end
    else
        for i=1:(size(Orig,2)-1)
            set(h(:,:,i),'Xdata',Orig(1,i:i+1),'Ydata',Orig(2,i:i+1),'Zdata',...
                Orig(3,i:i+1),'LineWidth',5);
        end
    end
    
    P = h;
end