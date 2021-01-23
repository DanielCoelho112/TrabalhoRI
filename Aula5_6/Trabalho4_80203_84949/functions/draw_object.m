function P1=draw_object(hiper_matrix,h,sitio)
    
   
p_obj_id = [0.5 1 0 1]';
p_obj_ie = [-0.5 1 0 1]';
p_obj_se = [-0.5 1 1.5 1]';
p_obj_sd = [0.5 1 1.5 1]';
p_obj_iey = [-0.5 -1 0 1]';
p_obj_idy = [0.5 -1 0 1]';
p_obj_sey = [-0.5 -1 1.5 1]';
p_obj_sdy = [0.5  -1 1.5 1]';

p_obj_o=[p_obj_id p_obj_ie p_obj_se p_obj_sd p_obj_iey p_obj_idy p_obj_sey p_obj_sdy];

trans_total = hiper_matrix(:,:,1)*hiper_matrix(:,:,2)*hiper_matrix(:,:,3)*hiper_matrix(:,:,4)*hiper_matrix(:,:,5);





if sitio==0
pontos_obj = trans3(11,0,1.5) * p_obj_o;
elseif sitio==2
    pontos_obj = trans3(-11,0,1.5) * p_obj_o;
    
else
    pontos_obj = trans_total * p_obj_o;
end

obj_face_1=[pontos_obj(:,2) pontos_obj(:,1) pontos_obj(:,4) pontos_obj(:,3)];
obj_face_2=[pontos_obj(:,5) pontos_obj(:,6) pontos_obj(:,8) pontos_obj(:,7)];
obj_face_3=[pontos_obj(:,2) pontos_obj(:,3) pontos_obj(:,7) pontos_obj(:,5)];
obj_face_4=[pontos_obj(:,1) pontos_obj(:,4) pontos_obj(:,8) pontos_obj(:,6)];
obj_face_5=[pontos_obj(:,1) pontos_obj(:,2) pontos_obj(:,5) pontos_obj(:,6)];
obj_face_6=[pontos_obj(:,4) pontos_obj(:,3) pontos_obj(:,7) pontos_obj(:,8)];




    
    if isempty(h)
        
        h1=fill3(obj_face_1(1,:),obj_face_1(2,:),obj_face_1(3,:),[0.8,0.4,0.3]);
        h2=fill3(obj_face_2(1,:),obj_face_2(2,:),obj_face_2(3,:),[0.8,0.4,0.3]);
        h3=fill3(obj_face_3(1,:),obj_face_3(2,:),obj_face_3(3,:),[0.8,0.4,0.3]);
        h4=fill3(obj_face_4(1,:),obj_face_4(2,:),obj_face_4(3,:),[0.8,0.4,0.3]);
        h5=fill3(obj_face_5(1,:),obj_face_5(2,:),obj_face_5(3,:),[0.8,0.4,0.3]);
        h6=fill3(obj_face_6(1,:),obj_face_6(2,:),obj_face_6(3,:),[0.8,0.4,0.3]);
        h=[h h1 h2 h3 h4 h5 h6];
        
        
    else
        set(h(1),'XData',obj_face_1(1,:),'YData',obj_face_1(2,:),'ZData',obj_face_1(3,:));
        set(h(2),'XData',obj_face_2(1,:),'YData',obj_face_2(2,:),'ZData',obj_face_2(3,:));
        set(h(3),'XData',obj_face_3(1,:),'YData',obj_face_3(2,:),'ZData',obj_face_3(3,:));
        set(h(4),'XData',obj_face_4(1,:),'YData',obj_face_4(2,:),'ZData',obj_face_4(3,:));
        set(h(5),'XData',obj_face_5(1,:),'YData',obj_face_5(2,:),'ZData',obj_face_5(3,:));
        set(h(6),'XData',obj_face_6(1,:),'YData',obj_face_6(2,:),'ZData',obj_face_6(3,:));
    end
        
        
 P1=h;
         
        
end