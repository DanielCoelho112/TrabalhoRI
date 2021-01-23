function draw_tables(al_f,extra)
    
   p_mesa_id = [2 4 0 1]';
p_mesa_ie = [0 4 0 1]';
p_mesa_se = [0 4 1.5 1]';
p_mesa_sd = [2 4 1.5 1]';
p_mesa_iey = [0 -4 0 1]';
p_mesa_idy = [2 -4 0 1]';
p_mesa_sey = [0 -4 1.5 1]';
p_mesa_sdy = [2  -4 1.5 1]';

p_mesa_o=[p_mesa_id p_mesa_ie p_mesa_se p_mesa_sd p_mesa_iey p_mesa_idy p_mesa_sey p_mesa_sdy];

pontos_mesa = trans3(10,0,0) * p_mesa_o;


mesa_face_1=[pontos_mesa(:,2) pontos_mesa(:,1) pontos_mesa(:,4) pontos_mesa(:,3)];
mesa_face_2=[pontos_mesa(:,5) pontos_mesa(:,6) pontos_mesa(:,8) pontos_mesa(:,7)];
mesa_face_3=[pontos_mesa(:,2) pontos_mesa(:,3) pontos_mesa(:,7) pontos_mesa(:,5)];
mesa_face_4=[pontos_mesa(:,1) pontos_mesa(:,4) pontos_mesa(:,8) pontos_mesa(:,6)];
mesa_face_5=[pontos_mesa(:,1) pontos_mesa(:,2) pontos_mesa(:,5) pontos_mesa(:,6)];
mesa_face_6=[pontos_mesa(:,4) pontos_mesa(:,3) pontos_mesa(:,7) pontos_mesa(:,8)];

fill3(mesa_face_1(1,:),mesa_face_1(2,:),mesa_face_1(3,:),[0.4,0.4,0.4]);
fill3(mesa_face_2(1,:),mesa_face_2(2,:),mesa_face_2(3,:),[0.4,0.4,0.4]);
fill3(mesa_face_3(1,:),mesa_face_3(2,:),mesa_face_3(3,:),[0.4,0.4,0.4]);
fill3(mesa_face_4(1,:),mesa_face_4(2,:),mesa_face_4(3,:),[0.4,0.4,0.4]);
fill3(mesa_face_5(1,:),mesa_face_5(2,:),mesa_face_5(3,:),[0.4,0.4,0.4]);
fill3(mesa_face_6(1,:),mesa_face_6(2,:),mesa_face_6(3,:),[0.4,0.4,0.4]);


p_mesa_2_id = [4 -4 -1.5 1]';
p_mesa_2_ie = [-4 -4 -1.5 1]';
p_mesa_2_se = [-4 -4 0 1]';
p_mesa_2_sd = [4 -4 0 1]';
p_mesa_2_iey = [-4 4 -1.5 1]';
p_mesa_2_idy = [4 4 -1.5 1]';
p_mesa_2_sey = [-4 4 0 1]';
p_mesa_2_sdy = [4 4 0 1]';

p_mesa_2_o=[p_mesa_2_id p_mesa_2_ie p_mesa_2_se p_mesa_2_sd p_mesa_2_iey p_mesa_2_idy p_mesa_2_sey p_mesa_2_sdy];
pontos_mesa_2 =  p_mesa_2_o;

mesa_2_face_1=[pontos_mesa_2(:,2) pontos_mesa_2(:,1) pontos_mesa_2(:,4) pontos_mesa_2(:,3)];
mesa_2_face_2=[pontos_mesa_2(:,5) pontos_mesa_2(:,6) pontos_mesa_2(:,8) pontos_mesa_2(:,7)];
mesa_2_face_3=[pontos_mesa_2(:,2) pontos_mesa_2(:,3) pontos_mesa_2(:,7) pontos_mesa_2(:,5)];
mesa_2_face_4=[pontos_mesa_2(:,1) pontos_mesa_2(:,4) pontos_mesa_2(:,8) pontos_mesa_2(:,6)];
mesa_2_face_5=[pontos_mesa_2(:,1) pontos_mesa_2(:,2) pontos_mesa_2(:,5) pontos_mesa_2(:,6)];
mesa_2_face_6=[pontos_mesa_2(:,4) pontos_mesa_2(:,3) pontos_mesa_2(:,7) pontos_mesa_2(:,8)];

fill3(mesa_2_face_1(1,:),mesa_2_face_1(2,:),mesa_2_face_1(3,:),[1,1,0]);
fill3(mesa_2_face_2(1,:),mesa_2_face_2(2,:),mesa_2_face_2(3,:),[1,1,0]);
fill3(mesa_2_face_3(1,:),mesa_2_face_3(2,:),mesa_2_face_3(3,:),[1,1,0]);
fill3(mesa_2_face_4(1,:),mesa_2_face_4(2,:),mesa_2_face_4(3,:),[1,1,0]);
fill3(mesa_2_face_5(1,:),mesa_2_face_5(2,:),mesa_2_face_5(3,:),[1,1,0]);
fill3(mesa_2_face_6(1,:),mesa_2_face_6(2,:),mesa_2_face_6(3,:),[1,1,0]);



if al_f==1 && extra==0
pontos_mesa_nova = trans3(-12,0,0) * p_mesa_o;


mesa_nova_face_1=[pontos_mesa_nova(:,2) pontos_mesa_nova(:,1) pontos_mesa_nova(:,4) pontos_mesa_nova(:,3)];
mesa_nova_face_2=[pontos_mesa_nova(:,5) pontos_mesa_nova(:,6) pontos_mesa_nova(:,8) pontos_mesa_nova(:,7)];
mesa_nova_face_3=[pontos_mesa_nova(:,2) pontos_mesa_nova(:,3) pontos_mesa_nova(:,7) pontos_mesa_nova(:,5)];
mesa_nova_face_4=[pontos_mesa_nova(:,1) pontos_mesa_nova(:,4) pontos_mesa_nova(:,8) pontos_mesa_nova(:,6)];
mesa_nova_face_5=[pontos_mesa_nova(:,1) pontos_mesa_nova(:,2) pontos_mesa_nova(:,5) pontos_mesa_nova(:,6)];
mesa_nova_face_6=[pontos_mesa_nova(:,4) pontos_mesa_nova(:,3) pontos_mesa_nova(:,7) pontos_mesa_nova(:,8)];

fill3(mesa_nova_face_1(1,:),mesa_nova_face_1(2,:),mesa_nova_face_1(3,:),[0.2,0.2,0.2]);
fill3(mesa_nova_face_2(1,:),mesa_nova_face_2(2,:),mesa_nova_face_2(3,:),[0.2,0.2,0.2]);
fill3(mesa_nova_face_3(1,:),mesa_nova_face_3(2,:),mesa_nova_face_3(3,:),[0.2,0.2,0.2]);
fill3(mesa_nova_face_4(1,:),mesa_nova_face_4(2,:),mesa_nova_face_4(3,:),[0.2,0.2,0.2]);
fill3(mesa_nova_face_5(1,:),mesa_nova_face_5(2,:),mesa_nova_face_5(3,:),[0.2,0.2,0.2]);
fill3(mesa_nova_face_6(1,:),mesa_nova_face_6(2,:),mesa_nova_face_6(3,:),[0.2,0.2,0.2]);


end



p_mesa_2_id = [4 -4 -1.5 1]';
p_mesa_2_ie = [-4 -4 -1.5 1]';
p_mesa_2_se = [-4 -4 0 1]';
p_mesa_2_sd = [4 -4 0 1]';
p_mesa_2_iey = [-4 4 -1.5 1]';
p_mesa_2_idy = [4 4 -1.5 1]';
p_mesa_2_sey = [-4 4 0 1]';
p_mesa_2_sdy = [4 4 0 1]';

p_mesa_2_o=[p_mesa_2_id p_mesa_2_ie p_mesa_2_se p_mesa_2_sd p_mesa_2_iey p_mesa_2_idy p_mesa_2_sey p_mesa_2_sdy];
pontos_mesa_2 =  p_mesa_2_o;

mesa_2_face_1=[pontos_mesa_2(:,2) pontos_mesa_2(:,1) pontos_mesa_2(:,4) pontos_mesa_2(:,3)];
mesa_2_face_2=[pontos_mesa_2(:,5) pontos_mesa_2(:,6) pontos_mesa_2(:,8) pontos_mesa_2(:,7)];
mesa_2_face_3=[pontos_mesa_2(:,2) pontos_mesa_2(:,3) pontos_mesa_2(:,7) pontos_mesa_2(:,5)];
mesa_2_face_4=[pontos_mesa_2(:,1) pontos_mesa_2(:,4) pontos_mesa_2(:,8) pontos_mesa_2(:,6)];
mesa_2_face_5=[pontos_mesa_2(:,1) pontos_mesa_2(:,2) pontos_mesa_2(:,5) pontos_mesa_2(:,6)];
mesa_2_face_6=[pontos_mesa_2(:,4) pontos_mesa_2(:,3) pontos_mesa_2(:,7) pontos_mesa_2(:,8)];

fill3(mesa_2_face_1(1,:),mesa_2_face_1(2,:),mesa_2_face_1(3,:),[1,1,0]);
fill3(mesa_2_face_2(1,:),mesa_2_face_2(2,:),mesa_2_face_2(3,:),[1,1,0]);
fill3(mesa_2_face_3(1,:),mesa_2_face_3(2,:),mesa_2_face_3(3,:),[1,1,0]);
fill3(mesa_2_face_4(1,:),mesa_2_face_4(2,:),mesa_2_face_4(3,:),[1,1,0]);
fill3(mesa_2_face_5(1,:),mesa_2_face_5(2,:),mesa_2_face_5(3,:),[1,1,0]);
fill3(mesa_2_face_6(1,:),mesa_2_face_6(2,:),mesa_2_face_6(3,:),[1,1,0]);




if extra==1
pontos_mesa_2_baixo = trans3(0,0,-10)  * p_mesa_2_o;

mesa_2_baixo_face_1=[pontos_mesa_2_baixo(:,2) pontos_mesa_2_baixo(:,1) pontos_mesa_2_baixo(:,4) pontos_mesa_2_baixo(:,3)];
mesa_2_baixo_face_2=[pontos_mesa_2_baixo(:,5) pontos_mesa_2_baixo(:,6) pontos_mesa_2_baixo(:,8) pontos_mesa_2_baixo(:,7)];
mesa_2_baixo_face_3=[pontos_mesa_2_baixo(:,2) pontos_mesa_2_baixo(:,3) pontos_mesa_2_baixo(:,7) pontos_mesa_2_baixo(:,5)];
mesa_2_baixo_face_4=[pontos_mesa_2_baixo(:,1) pontos_mesa_2_baixo(:,4) pontos_mesa_2_baixo(:,8) pontos_mesa_2_baixo(:,6)];
mesa_2_baixo_face_5=[pontos_mesa_2_baixo(:,1) pontos_mesa_2_baixo(:,2) pontos_mesa_2_baixo(:,5) pontos_mesa_2_baixo(:,6)];
mesa_2_baixo_face_6=[pontos_mesa_2_baixo(:,4) pontos_mesa_2_baixo(:,3) pontos_mesa_2_baixo(:,7) pontos_mesa_2_baixo(:,8)];

fill3(mesa_2_baixo_face_1(1,:),mesa_2_baixo_face_1(2,:),mesa_2_baixo_face_1(3,:),[1,1,0]);
fill3(mesa_2_baixo_face_2(1,:),mesa_2_baixo_face_2(2,:),mesa_2_baixo_face_2(3,:),[1,1,0]);
fill3(mesa_2_baixo_face_3(1,:),mesa_2_baixo_face_3(2,:),mesa_2_baixo_face_3(3,:),[1,1,0]);
fill3(mesa_2_baixo_face_4(1,:),mesa_2_baixo_face_4(2,:),mesa_2_baixo_face_4(3,:),[1,1,0]);
fill3(mesa_2_baixo_face_5(1,:),mesa_2_baixo_face_5(2,:),mesa_2_baixo_face_5(3,:),[1,1,0]);
fill3(mesa_2_baixo_face_6(1,:),mesa_2_baixo_face_6(2,:),mesa_2_baixo_face_6(3,:),[1,1,0]);





pontos_mesa_baixo = trans3(10,0,-10) * p_mesa_o;

mesa_baixo_face_1=[pontos_mesa_baixo(:,2) pontos_mesa_baixo(:,1) pontos_mesa_baixo(:,4) pontos_mesa_baixo(:,3)];
mesa_baixo_face_2=[pontos_mesa_baixo(:,5) pontos_mesa_baixo(:,6) pontos_mesa_baixo(:,8) pontos_mesa_baixo(:,7)];
mesa_baixo_face_3=[pontos_mesa_baixo(:,2) pontos_mesa_baixo(:,3) pontos_mesa_baixo(:,7) pontos_mesa_baixo(:,5)];
mesa_baixo_face_4=[pontos_mesa_baixo(:,1) pontos_mesa_baixo(:,4) pontos_mesa_baixo(:,8) pontos_mesa_baixo(:,6)];
mesa_baixo_face_5=[pontos_mesa_baixo(:,1) pontos_mesa_baixo(:,2) pontos_mesa_baixo(:,5) pontos_mesa_baixo(:,6)];
mesa_baixo_face_6=[pontos_mesa_baixo(:,4) pontos_mesa_baixo(:,3) pontos_mesa_baixo(:,7) pontos_mesa_baixo(:,8)];

fill3(mesa_baixo_face_1(1,:),mesa_baixo_face_1(2,:),mesa_baixo_face_1(3,:),[0.4,0.4,0.4]);
fill3(mesa_baixo_face_2(1,:),mesa_baixo_face_2(2,:),mesa_baixo_face_2(3,:),[0.4,0.4,0.4]);
fill3(mesa_baixo_face_3(1,:),mesa_baixo_face_3(2,:),mesa_baixo_face_3(3,:),[0.4,0.4,0.4]);
fill3(mesa_baixo_face_4(1,:),mesa_baixo_face_4(2,:),mesa_baixo_face_4(3,:),[0.4,0.4,0.4]);
fill3(mesa_baixo_face_5(1,:),mesa_baixo_face_5(2,:),mesa_baixo_face_5(3,:),[0.4,0.4,0.4]);
fill3(mesa_baixo_face_6(1,:),mesa_baixo_face_6(2,:),mesa_baixo_face_6(3,:),[0.4,0.4,0.4]);


end





end

        
 
         
        
