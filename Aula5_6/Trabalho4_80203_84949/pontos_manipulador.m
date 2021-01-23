

p_elo1_id = [1 -1 0 1]';
p_elo1_ie = [-1 -1 0 1]';
p_elo1_se = [-1 -1 4 1]';
p_elo1_sd = [1 -1 4 1]';
p_elo1_iey = [-1 1 0 1]';
p_elo1_idy = [1 1 0 1]';
p_elo1_sey = [-1 1 4 1]';
p_elo1_sdy = [1  1 4 1]';



p_elo1_o=[p_elo1_id p_elo1_ie p_elo1_se p_elo1_sd p_elo1_iey p_elo1_idy p_elo1_sey p_elo1_sdy];


%ELO2 1 de largura

p_elo2_id = [0.5 -0.5 0 1]';
p_elo2_ie = [-0.5 -0.5 0 1]';
p_elo2_se = [-0.5 -0.5 6 1]';
p_elo2_sd = [0.5 -0.5 6 1]';
p_elo2_iey = [-0.5 0.5 0 1]';
p_elo2_idy = [0.5  0.5 0 1]';
p_elo2_sey = [-0.5 0.5 6 1]';
p_elo2_sdy = [0.5  0.5 6 1]';


p_elo2_o=[p_elo2_id p_elo2_ie p_elo2_se p_elo2_sd p_elo2_iey p_elo2_idy p_elo2_sey p_elo2_sdy];


%ELO3 1 de largura

p_elo3_id = [0.5 -0.5 0 1]';
p_elo3_ie = [-0.5 -0.5 0 1]';
p_elo3_se = [-0.5 -0.5 5 1]';
p_elo3_sd = [0.5 -0.5 5 1]';
p_elo3_iey = [-0.5 0.5 0 1]';
p_elo3_idy = [0.5  0.5 0 1]';
p_elo3_sey = [-0.5 0.5 5 1]';
p_elo3_sdy = [0.5  0.5 5 1]';

p_elo3_o=[p_elo3_id p_elo3_ie p_elo3_se p_elo3_sd p_elo3_iey p_elo3_idy p_elo3_sey p_elo3_sdy];

%ELO4 1 de largura

p_elo4_id = [0.5 -0.5 0 1]';
p_elo4_ie = [-0.5 -0.5 0 1]';
p_elo4_se = [-0.5 -0.5 1 1]';
p_elo4_sd = [0.5 -0.5 1 1]';
p_elo4_iey = [-0.5 0.5 0 1]';
p_elo4_idy = [0.5  0.5 0 1]';
p_elo4_sey = [-0.5 0.5 1 1]';
p_elo4_sdy = [0.5  0.5 1 1]';

p_elo4_o=[p_elo4_id p_elo4_ie p_elo4_se p_elo4_sd p_elo4_iey p_elo4_idy p_elo4_sey p_elo4_sdy];


%gripper 1.5 altura, 1 largura
p_elo5_id = [0.5 -0.5 0 1]';
p_elo5_ie = [-0.5 -0.5 0 1]';
p_elo5_se = [-0.5 -0.5 1.5 1]';
p_elo5_sd = [0.5 -0.5 1.5 1]';
p_elo5_iey = [-0.5 0.5 0 1]';
p_elo5_idy = [0.5  0.5 0 1]';
p_elo5_sey = [-0.5 0.5 1.5 1]';
p_elo5_sdy = [0.5  0.5 1.5 1]';

p_elo5_o=[p_elo5_id p_elo5_ie p_elo5_se p_elo5_sd p_elo5_iey p_elo5_idy p_elo5_sey p_elo5_sdy];


%Coordenadas Objeto

p_obj_id = [1 1 0 1]';
p_obj_ie = [0 1 0 1]';
p_obj_se = [0 1 1.5 1]';
p_obj_sd = [1 1 1.5 1]';
p_obj_iey = [0 -1 0 1]';
p_obj_idy = [1 -1 0 1]';
p_obj_sey = [0 -1 1.5 1]';
p_obj_sdy = [1  -1 1.5 1]';

p_obj_o=[p_obj_id p_obj_ie p_obj_se p_obj_sd p_obj_iey p_obj_idy p_obj_sey p_obj_sdy];

pontos_obj = trans3(10.5,0,1.5) * p_obj_o;

obj_face_1=[pontos_obj(:,2) pontos_obj(:,1) pontos_obj(:,4) pontos_obj(:,3)];
obj_face_2=[pontos_obj(:,5) pontos_obj(:,6) pontos_obj(:,8) pontos_obj(:,7)];
obj_face_3=[pontos_obj(:,2) pontos_obj(:,3) pontos_obj(:,7) pontos_obj(:,5)];
obj_face_4=[pontos_obj(:,1) pontos_obj(:,4) pontos_obj(:,8) pontos_obj(:,6)];
obj_face_5=[pontos_obj(:,1) pontos_obj(:,2) pontos_obj(:,5) pontos_obj(:,6)];
obj_face_6=[pontos_obj(:,4) pontos_obj(:,3) pontos_obj(:,7) pontos_obj(:,8)];

F1_obj=fill3(obj_face_1(1,:),obj_face_1(2,:),obj_face_1(3,:),[0.8,0.4,0.3]);
F2_obj=fill3(obj_face_2(1,:),obj_face_2(2,:),obj_face_2(3,:),[0.8,0.4,0.3]);
F3_obj=fill3(obj_face_3(1,:),obj_face_3(2,:),obj_face_3(3,:),[0.8,0.4,0.3]);
F4_obj=fill3(obj_face_4(1,:),obj_face_4(2,:),obj_face_4(3,:),[0.8,0.4,0.3]);
F5_obj=fill3(obj_face_5(1,:),obj_face_5(2,:),obj_face_5(3,:),[0.8,0.4,0.3]);
F6_obj=fill3(obj_face_6(1,:),obj_face_6(2,:),obj_face_6(3,:),[0.8,0.4,0.3]);













