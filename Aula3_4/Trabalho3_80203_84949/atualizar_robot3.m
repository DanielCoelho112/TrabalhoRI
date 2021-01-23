function D = atualizar_robot3(Fill_Elos,pontos_elo1,pontos_elo2,pontos_elo3,pontos_end)


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

end_face_1=[pontos_end(:,2) pontos_end(:,1) pontos_end(:,4) pontos_end(:,3)];
end_face_2=[pontos_end(:,5) pontos_end(:,6) pontos_end(:,8) pontos_end(:,7)];
end_face_3=[pontos_end(:,2) pontos_end(:,3) pontos_end(:,7) pontos_end(:,5)];
end_face_4=[pontos_end(:,1) pontos_end(:,4) pontos_end(:,8) pontos_end(:,6)];

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
 
 set( Fill_Elos(15), 'XData', end_face_1(1,:), 'YData', end_face_1(2,:),'ZData',end_face_1(3,:));
 set( Fill_Elos(16), 'XData', end_face_2(1,:), 'YData', end_face_2(2,:),'ZData',end_face_2(3,:));
 set( Fill_Elos(17), 'XData', end_face_3(1,:), 'YData', end_face_3(2,:),'ZData',end_face_3(3,:));
 set( Fill_Elos(18), 'XData', end_face_4(1,:), 'YData', end_face_4(2,:),'ZData',end_face_4(3,:));







