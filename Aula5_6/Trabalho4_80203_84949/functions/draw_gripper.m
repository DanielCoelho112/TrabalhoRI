function P1=draw_gripper(hiper_matrix,h)
    
   
p_grip_id = [0.5 -0.5 0 1]';
p_grip_ie = [-0.5 -0.5 0 1]';
p_grip_se = [-0.5 -0.5 1.5 1]';
p_grip_sd = [0.5 -0.5 1.5 1]';
p_grip_iey = [-0.5 0.5 0 1]';
p_grip_idy = [0.5  0.5 0 1]';
p_grip_sey = [-0.5 0.5 1.5 1]';
p_grip_sdy = [0.5  0.5 1.5 1]';

p_grip_o=[p_grip_id p_grip_ie p_grip_se p_grip_sd p_grip_iey p_grip_idy p_grip_sey p_grip_sdy];

trans_total = hiper_matrix(:,:,1)*hiper_matrix(:,:,2)*hiper_matrix(:,:,3)*hiper_matrix(:,:,4)*hiper_matrix(:,:,5);

new_grip = trans_total * p_grip_o ;

elo5_face_3=[new_grip(:,2) new_grip(:,3) new_grip(:,7) new_grip(:,5)];
elo5_face_4=[new_grip(:,1) new_grip(:,4) new_grip(:,8) new_grip(:,6)];
elo5_face_5=[new_grip(:,1) new_grip(:,2) new_grip(:,5) new_grip(:,6)];


    
    if isempty(h)
        
        h1=fill3(elo5_face_3(1,:),elo5_face_3(2,:),elo5_face_3(3,:),[1 0.5 1]);
        h2=fill3(elo5_face_4(1,:),elo5_face_4(2,:),elo5_face_4(3,:),[1 0.5 1]);
        h3=fill3(elo5_face_5(1,:),elo5_face_5(2,:),elo5_face_5(3,:),[1 0.5 1]);
        h=[h h1 h2 h3];
        
        
    else
        set(h(1),'XData',elo5_face_3(1,:),'YData',elo5_face_3(2,:),'ZData',elo5_face_3(3,:));
        set(h(2),'XData',elo5_face_4(1,:),'YData',elo5_face_4(2,:),'ZData',elo5_face_4(3,:));
        set(h(3),'XData',elo5_face_5(1,:),'YData',elo5_face_5(2,:),'ZData',elo5_face_5(3,:));
    end
        
        
 P1=h;
         
        
end