function [DH_matrix, r]=Joint2CartExtra(theta1,theta2,theta3,theta4,theta5,theta6)
%   Função para calcular o espaço cartesiano dado o espaço de juntas
    if theta2~=0
        theta3=theta2+theta3;
    end
    theta1=deg2rad(theta1);
    theta2=deg2rad(theta2);
    theta3=deg2rad(theta3);
    theta4=deg2rad(theta4);
    theta5=deg2rad(theta5);
    theta6=deg2rad(theta6);

    [LA, LB, LC, LD, LE, LF] = deal(0, 3, 7.2, 2.0, 8.6, 2.0);
    
%   Matriz DH inicial
    DH_matrix = [ theta1+pi/2     pi/2     0     LA
                     pi/2         pi/2     0     LB
                    theta2         pi      LC    0 
                    theta3        pi/2     LD    0 
                      0            pi      0     LE 
                    theta4        pi/2     0     0
                    theta5       -pi/2     0     0
                    theta6         pi      0    -LF   ];
   
%   Sequência de transformações desde a origem (O) até ao gripper (G)
    OTG = GetOTG(DH_matrix);
    
    p0 = [0 0 0 1]';

    pw = OTG*p0;

    phi_4 = rad2deg(atan2(OTG(3,2),OTG(3,3)));
    theta_4 = rad2deg(asin(-OTG(3,1)));
    psi_4 = rad2deg(atan2(OTG(2,1),OTG(1,1)));

    r = round([pw(1:3) ; phi_4 ; theta_4 ; psi_4],1);

end