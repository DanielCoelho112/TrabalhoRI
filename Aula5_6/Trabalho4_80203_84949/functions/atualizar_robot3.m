function D = atualizar_robot3(Fill_Elos,pontos_elo1,pontos_elo2,pontos_elo3,pontos_elo4,pontos_elo5)


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

elo5_face_1=[pontos_elo5(:,2) pontos_elo5(:,1) pontos_elo5(:,4) pontos_elo5(:,3)];
elo5_face_2=[pontos_elo5(:,5) pontos_elo5(:,6) pontos_elo5(:,8) pontos_elo5(:,7)];
elo5_face_3=[pontos_elo5(:,2) pontos_elo5(:,3) pontos_elo5(:,7) pontos_elo5(:,5)];
elo5_face_4=[pontos_elo5(:,1) pontos_elo5(:,4) pontos_elo5(:,8) pontos_elo5(:,6)];
elo5_face_5=[pontos_elo5(:,1) pontos_elo5(:,2) pontos_elo5(:,5) pontos_elo5(:,6)];


 set( Fill_Elos(1), 'XData', elo1_face_1(1,:), 'YData', elo1_face_1(2,:), 'ZData',elo1_face_1(3,:));
 set( Fill_Elos(2), 'XData', elo1_face_2(1,:), 'YData', elo1_face_2(2,:),'ZData',elo1_face_2(3,:));
 set( Fill_Elos(3), 'XData', elo1_face_3(1,:), 'YData', elo1_face_3(2,:),'ZData',elo1_face_3(3,:));
 set( Fill_Elos(4), 'XData', elo1_face_4(1,:), 'YData', elo1_face_4(2,:),'ZData',elo1_face_4(3,:));
 set( Fill_Elos(5), 'XData', elo1_face_5(1,:), 'YData', elo1_face_5(2,:),'ZData',elo1_face_5(3,:));
 
 set( Fill_Elos(6), 'XData', elo2_face_1(1,:), 'YData', elo2_face_1(2,:),'ZData',elo2_face_1(3,:));
 set( Fill_Elos(7), 'XData', elo2_face_2(1,:), 'YData', elo2_face_2(2,:),'ZData',elo2_face_2(3,:));
 set( Fill_Elos(8), 'XData', elo2_face_3(1,:), 'YData', elo2_face_3(2,:),'ZData',elo2_face_3(3,:));
 set( Fill_Elos(9), 'XData', elo2_face_4(1,:), 'YData', elo2_face_4(2,:),'ZData',elo2_face_4(3,:));
 
 set( Fill_Elos(10), 'XData', elo3_face_1(1,:), 'YData', elo3_face_1(2,:),'ZData',elo3_face_1(3,:));
 set( Fill_Elos(11), 'XData', elo3_face_2(1,:), 'YData', elo3_face_2(2,:),'ZData',elo3_face_2(3,:));
 set( Fill_Elos(12), 'XData', elo3_face_3(1,:), 'YData', elo3_face_3(2,:),'ZData',elo3_face_3(3,:));
 set( Fill_Elos(13), 'XData', elo3_face_4(1,:), 'YData', elo3_face_4(2,:),'ZData',elo3_face_4(3,:));
 set( Fill_Elos(14), 'XData', elo3_face_5(1,:), 'YData', elo3_face_5(2,:),'ZData',elo3_face_5(3,:));
 
  
 set( Fill_Elos(15), 'XData', elo4_face_1(1,:), 'YData', elo4_face_1(2,:),'ZData',elo4_face_1(3,:));
 set( Fill_Elos(16), 'XData', elo4_face_2(1,:), 'YData', elo4_face_2(2,:),'ZData',elo4_face_2(3,:));
 set( Fill_Elos(17), 'XData', elo4_face_3(1,:), 'YData', elo4_face_3(2,:),'ZData',elo4_face_3(3,:));
 set( Fill_Elos(18), 'XData', elo4_face_4(1,:), 'YData', elo4_face_4(2,:),'ZData',elo4_face_4(3,:));
set( Fill_Elos(19), 'XData', elo4_face_5(1,:), 'YData', elo4_face_5(2,:),'ZData',elo4_face_5(3,:));


 set( Fill_Elos(20), 'XData', elo5_face_3(1,:), 'YData', elo5_face_3(2,:),'ZData',elo5_face_3(3,:));
 set( Fill_Elos(21), 'XData', elo5_face_4(1,:), 'YData', elo5_face_4(2,:),'ZData',elo5_face_4(3,:));
 set( Fill_Elos(22), 'XData', elo5_face_5(1,:), 'YData', elo5_face_5(2,:),'ZData',elo5_face_5(3,:));




