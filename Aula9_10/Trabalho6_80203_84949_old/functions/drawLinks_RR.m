function [P]=drawLinks_RR(Hiper_DH,h)
    hold on
    [LB, LC] = deal(150, 360);
   
    F_elos = [  1   2   6   5
                1   5   8   4
                3   7   8   4
                2   6   7   3 ];
    
        
    P_elo = [  10   10   0     % P1
               10  -10   0     % P2
              -10  -10   0     % P3
              -10   10   0     % P4
               10   10   0     % P5
               10  -10   0     % P6
              -10  -10   0     % P7
              -10   10   0 ];  % P8
          
    if nargin==1     
        P_elo1 = P_elo; P_elo1(5:end,3)=LB; P_elo1 = [P_elo1 ones(size(P_elo1,1),1)]';
        P_elo1 = rotx(pi/2)*P_elo1;
        P_elo1 = Hiper_DH(:,:,1)*Hiper_DH(:,:,2)*P_elo1;
        elo1_1 = patch('Vertices',P_elo1(1:3,:)','Faces',F_elos(1,:),'Facecolor','#1a1a1a');
        elo1_2 = patch('Vertices',P_elo1(1:3,:)','Faces',F_elos(2:4,:),'Facecolor','#e6b800');
        h(:,:,1)=elo1_1;
        h(:,:,2)=elo1_2;

        P_elo2 = P_elo; P_elo2(5:end,3)=LC; P_elo2 = [P_elo2 ones(size(P_elo2,1),1)]';
        P_elo2 = roty(-pi/2)*rotz(pi/2)*P_elo2;
        P_elo2 = Hiper_DH(:,:,1)*Hiper_DH(:,:,2)*Hiper_DH(:,:,3)*P_elo2;
        elo2_1 = patch('Vertices',P_elo2(1:3,:)','Faces',F_elos(1,:),'Facecolor','#1a1a1a');
        elo2_2 = patch('Vertices',P_elo2(1:3,:)','Faces',F_elos(2:4,:),'Facecolor','#e6b800');
        h(:,:,3)=elo2_1;
        h(:,:,4)=elo2_2;
% 
%         P_elo3 = P_elo; P_elo3(5:end,3)=LD; P_elo3 = [P_elo3 ones(size(P_elo3,1),1)]';
%         P_elo3 = roty(-pi/2)*rotz(pi)*P_elo3;
%         P_elo3 = Hiper_DH(:,:,1)*Hiper_DH(:,:,2)*Hiper_DH(:,:,3)*...
%                  Hiper_DH(:,:,4)*P_elo3;
%         elo3_1 = patch('Vertices',P_elo3(1:3,:)','Faces',F_elos(1,:),'Facecolor','#1a1a1a');
%         elo3_2 = patch('Vertices',P_elo3(1:3,:)','Faces',F_elos(2:4,:),'Facecolor','#e6b800');
%         h(:,:,5)=elo3_1;
%         h(:,:,6)=elo3_2;

%         P_elo4 = P_elo; P_elo4(5:end,3)=LE; P_elo4 = [P_elo4 ones(size(P_elo4,1),1)]';
%         P_elo4 = rotx(-pi/2)*P_elo4;
%         P_elo4 = Hiper_DH(:,:,1)*Hiper_DH(:,:,2)*Hiper_DH(:,:,3)*Hiper_DH(:,:,4)*...
%                  Hiper_DH(:,:,5)*Hiper_DH(:,:,6)*P_elo4;
%         elo4_1 = patch('Vertices',P_elo4(1:3,:)','Faces',F_elos(1,:),'Facecolor','#1a1a1a');
%         elo4_2 = patch('Vertices',P_elo4(1:3,:)','Faces',F_elos(2:4,:),'Facecolor','#e6b800');
%         h(:,:,7)=elo4_1;
%         h(:,:,8)=elo4_2;
% 
%         P_elo5 = P_elo; P_elo5(5:end,3)=LF; P_elo5 = [P_elo5 ones(size(P_elo5,1),1)]';
%         P_elo5 = rotx(pi)*P_elo5;
%         P_elo5 = Hiper_DH(:,:,1)*Hiper_DH(:,:,2)*Hiper_DH(:,:,3)*...
%                  Hiper_DH(:,:,4)*Hiper_DH(:,:,5)*Hiper_DH(:,:,6)*...
%                  Hiper_DH(:,:,7)*Hiper_DH(:,:,8)*P_elo5;
%         elo5_1 = patch('Vertices',P_elo5(1:3,:)','Faces',F_elos(1,:),'Facecolor','#1a1a1a');
%         elo5_2 = patch('Vertices',P_elo5(1:3,:)','Faces',F_elos(2:4,:),'Facecolor','#e6b800');
%         h(:,:,9)=elo5_1;
%         h(:,:,10)=elo5_2;
    
    else
        P_elo1 = P_elo; P_elo1(5:end,3)=LB; P_elo1 = [P_elo1 ones(size(P_elo1,1),1)]';
        P_elo1 = rotx(pi/2)*P_elo1;
        P_elo1 = Hiper_DH(:,:,1)*Hiper_DH(:,:,2)*P_elo1;
        set(h(:,:,1),'Vertices',P_elo1(1:3,:)','Faces',F_elos(1,:),'Facecolor','#1a1a1a');
        set(h(:,:,2),'Vertices',P_elo1(1:3,:)','Faces',F_elos(2:4,:),'Facecolor','#e6b800');

        P_elo2 = P_elo; P_elo2(5:end,3)=LC; P_elo2 = [P_elo2 ones(size(P_elo2,1),1)]';
        P_elo2 = roty(-pi/2)*rotz(pi/2)*P_elo2;
        P_elo2 = Hiper_DH(:,:,1)*Hiper_DH(:,:,2)*Hiper_DH(:,:,3)*P_elo2;
        set(h(:,:,3),'Vertices',P_elo2(1:3,:)','Faces',F_elos(1,:),'Facecolor','#1a1a1a');
        set(h(:,:,4),'Vertices',P_elo2(1:3,:)','Faces',F_elos(2:4,:),'Facecolor','#e6b800');

% 
%         P_elo3 = P_elo; P_elo3(5:end,3)=LD; P_elo3 = [P_elo3 ones(size(P_elo3,1),1)]';
%         P_elo3 = roty(-pi/2)*rotz(pi)*P_elo3;
%         P_elo3 = Hiper_DH(:,:,1)*Hiper_DH(:,:,2)*Hiper_DH(:,:,3)*...
%                  Hiper_DH(:,:,4)*P_elo3;
%         set(h(:,:,5),'Vertices',P_elo3(1:3,:)','Faces',F_elos(1,:),'Facecolor','#1a1a1a');
%         set(h(:,:,6),'Vertices',P_elo3(1:3,:)','Faces',F_elos(2:4,:),'Facecolor','#e6b800');

% 
%         P_elo4 = P_elo; P_elo4(5:end,3)=LE; P_elo4 = [P_elo4 ones(size(P_elo4,1),1)]';
%         P_elo4 = rotx(-pi/2)*P_elo4;
%         P_elo4 = Hiper_DH(:,:,1)*Hiper_DH(:,:,2)*Hiper_DH(:,:,3)*Hiper_DH(:,:,4)*...
%                  Hiper_DH(:,:,5)*Hiper_DH(:,:,6)*P_elo4;
%         set(h(:,:,7),'Vertices',P_elo4(1:3,:)','Faces',F_elos(1,:),'Facecolor','#1a1a1a');
%         set(h(:,:,8),'Vertices',P_elo4(1:3,:)','Faces',F_elos(2:4,:),'Facecolor','#e6b800');
% 
% 
%         P_elo5 = P_elo; P_elo5(5:end,3)=LF; P_elo5 = [P_elo5 ones(size(P_elo5,1),1)]';
%         P_elo5 = rotx(pi)*P_elo5;
%         P_elo5 = Hiper_DH(:,:,1)*Hiper_DH(:,:,2)*Hiper_DH(:,:,3)*...
%                  Hiper_DH(:,:,4)*Hiper_DH(:,:,5)*Hiper_DH(:,:,6)*...
%                  Hiper_DH(:,:,7)*Hiper_DH(:,:,8)*P_elo5;
        set(h(:,:,9),'Vertices',P_elo5(1:3,:)','Faces',F_elos(1,:),'Facecolor','#1a1a1a');
        set(h(:,:,10),'Vertices',P_elo5(1:3,:)','Faces',F_elos(2:4,:),'Facecolor','#e6b800');
    end

    P=h;
end
