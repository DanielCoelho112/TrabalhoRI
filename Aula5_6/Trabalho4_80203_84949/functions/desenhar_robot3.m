function D = desenhar_robot3(pontos_elo1,pontos_elo2,pontos_elo3,pontos_elo4,pontos_elo5)

axis([-15 15 -15 15 -15 15]); xlabel('x'); ylabel('y'); zlabel('z')

hold on; grid on; axis square 


%Extração da matriz pontos do elo para varias matrizes que simbolizam as
%faces de cado elo
elo1_face_1=[pontos_elo1(:,2) pontos_elo1(:,1) pontos_elo1(:,4) pontos_elo1(:,3)];
elo1_face_2=[pontos_elo1(:,5) pontos_elo1(:,6) pontos_elo1(:,8) pontos_elo1(:,7)];
elo1_face_3=[pontos_elo1(:,2) pontos_elo1(:,3) pontos_elo1(:,7) pontos_elo1(:,5)];
elo1_face_4=[pontos_elo1(:,1) pontos_elo1(:,4) pontos_elo1(:,8) pontos_elo1(:,6)];
elo1_face_5=[pontos_elo1(:,1) pontos_elo1(:,2) pontos_elo1(:,5) pontos_elo1(:,6)];

elo2_face_1=[pontos_elo2(:,2) pontos_elo2(:,1) pontos_elo2(:,4) pontos_elo2(:,3)];
elo2_face_2=[pontos_elo2(:,5) pontos_elo2(:,6) pontos_elo2(:,8) pontos_elo2(:,7)];
elo2_face_3=[pontos_elo2(:,2) pontos_elo2(:,3) pontos_elo2(:,7) pontos_elo2(:,5)];
elo2_face_4=[pontos_elo2(:,1) pontos_elo2(:,4) pontos_elo2(:,8) pontos_elo2(:,6)];

elo3_face_1=[pontos_elo3(:,2) pontos_elo3(:,1) pontos_elo3(:,4) pontos_elo3(:,3)];
elo3_face_2=[pontos_elo3(:,5) pontos_elo3(:,6) pontos_elo3(:,8) pontos_elo3(:,7)];
elo3_face_3=[pontos_elo3(:,2) pontos_elo3(:,3) pontos_elo3(:,7) pontos_elo3(:,5)];
elo3_face_4=[pontos_elo3(:,1) pontos_elo3(:,4) pontos_elo3(:,8) pontos_elo3(:,6)];
elo3_face_5=[pontos_elo3(:,4) pontos_elo3(:,3) pontos_elo3(:,7) pontos_elo3(:,8)];


elo4_face_1=[pontos_elo4(:,2) pontos_elo4(:,1) pontos_elo4(:,4) pontos_elo4(:,3)];
elo4_face_2=[pontos_elo4(:,5) pontos_elo4(:,6) pontos_elo4(:,8) pontos_elo4(:,7)];
elo4_face_3=[pontos_elo4(:,2) pontos_elo4(:,3) pontos_elo4(:,7) pontos_elo4(:,5)];
elo4_face_4=[pontos_elo4(:,1) pontos_elo4(:,4) pontos_elo4(:,8) pontos_elo4(:,6)];
elo4_face_5=[pontos_elo4(:,4) pontos_elo4(:,3) pontos_elo4(:,7) pontos_elo4(:,8)];

if pontos_elo5 ~=0

elo5_face_1=[pontos_elo5(:,2) pontos_elo5(:,1) pontos_elo5(:,4) pontos_elo5(:,3)];
elo5_face_2=[pontos_elo5(:,5) pontos_elo5(:,6) pontos_elo5(:,8) pontos_elo5(:,7)];
elo5_face_3=[pontos_elo5(:,2) pontos_elo5(:,3) pontos_elo5(:,7) pontos_elo5(:,5)];
elo5_face_4=[pontos_elo5(:,1) pontos_elo5(:,4) pontos_elo5(:,8) pontos_elo5(:,6)];
elo5_face_5=[pontos_elo5(:,1) pontos_elo5(:,2) pontos_elo5(:,5) pontos_elo5(:,6)];
end

%representação das faces de todos os elos

F1_elo1=fill3(elo1_face_1(1,:),elo1_face_1(2,:),elo1_face_1(3,:),'Green');
F2_elo1=fill3(elo1_face_2(1,:),elo1_face_2(2,:),elo1_face_2(3,:),'Green');
F3_elo1=fill3(elo1_face_3(1,:),elo1_face_3(2,:),elo1_face_3(3,:),'Green');
F4_elo1=fill3(elo1_face_4(1,:),elo1_face_4(2,:),elo1_face_4(3,:),'Green');
F5_elo1=fill3(elo1_face_5(1,:),elo1_face_5(2,:),elo1_face_5(3,:),'Green');


F1_elo2=fill3(elo2_face_1(1,:),elo2_face_1(2,:),elo2_face_1(3,:),'Blue');
F2_elo2=fill3(elo2_face_2(1,:),elo2_face_2(2,:),elo2_face_2(3,:),'Blue');
F3_elo2=fill3(elo2_face_3(1,:),elo2_face_3(2,:),elo2_face_3(3,:),'Blue');
F4_elo2=fill3(elo2_face_4(1,:),elo2_face_4(2,:),elo2_face_4(3,:),'Blue');

F1_elo3=fill3(elo3_face_1(1,:),elo3_face_1(2,:),elo3_face_1(3,:),'Red');
F2_elo3=fill3(elo3_face_2(1,:),elo3_face_2(2,:),elo3_face_2(3,:),'Red');
F3_elo3=fill3(elo3_face_3(1,:),elo3_face_3(2,:),elo3_face_3(3,:),'Red');
F4_elo3=fill3(elo3_face_4(1,:),elo3_face_4(2,:),elo3_face_4(3,:),'Red');
F5_elo3=fill3(elo3_face_5(1,:),elo3_face_5(2,:),elo3_face_5(3,:),'Red');


F1_elo4=fill3(elo4_face_1(1,:),elo4_face_1(2,:),elo4_face_1(3,:),[0 1 1]);
F2_elo4=fill3(elo4_face_2(1,:),elo4_face_2(2,:),elo4_face_2(3,:),[0 1 1]);
F3_elo4=fill3(elo4_face_3(1,:),elo4_face_3(2,:),elo4_face_3(3,:),[0 1 1]);
F4_elo4=fill3(elo4_face_4(1,:),elo4_face_4(2,:),elo4_face_4(3,:),[0 1 1]);
F5_elo4=fill3(elo4_face_5(1,:),elo4_face_5(2,:),elo4_face_5(3,:),[0 1 1]);

if pontos_elo5 ~=0
    
F3_elo5=fill3(elo5_face_3(1,:),elo5_face_3(2,:),elo5_face_3(3,:),[1 0.5 1]);
F4_elo5=fill3(elo5_face_4(1,:),elo5_face_4(2,:),elo5_face_4(3,:),[1 0.5 1]);
F5_elo5=fill3(elo5_face_5(1,:),elo5_face_5(2,:),elo5_face_5(3,:),[1 0.5 1]);
end 

if pontos_elo5 ~=0
D=[F1_elo1 F2_elo1 F3_elo1 F4_elo1 F5_elo1 F1_elo2 F2_elo2 F3_elo2 F4_elo2 F1_elo3 F2_elo3 F3_elo3 F4_elo3 F5_elo3 F1_elo4 F2_elo4 F3_elo4 F4_elo4 F5_elo4 F3_elo5 F4_elo5 F5_elo5];

else
    D=[F1_elo1 F2_elo1 F3_elo1 F4_elo1 F5_elo1 F1_elo2 F2_elo2 F3_elo2 F4_elo2 F1_elo3 F2_elo3 F3_elo3 F4_elo3 F5_elo3 F1_elo4 F2_elo4 F3_elo4 F4_elo4 F5_elo4];
end






end