function [theta1_deg,theta2_deg,theta3_deg,theta4_deg,theta5_deg,theta6_deg,DH]=Cart2JointExtra(r,red_theta2,red_theta3,red_theta5)
%   Função para calcular o espaço de juntas sabendo o espaço cartesiano

%Comprimentos dos elos do manipulador

[La,Lb, Lc, Ld, Le, Lf] = deal(0,3, 7.2, 2.0, 8.6, 2.0);




%Saber o vetor nsa com base na orientaçao do end effector

a1=cos(deg2rad(r(4)))*cos(deg2rad(r(6)))*sin(deg2rad(r(5))) + sin(deg2rad(r(4))) * sin(deg2rad(r(6)));
a2=-cos(deg2rad(r(6)))*sin(deg2rad(r(4))) + cos(deg2rad(r(4))) * sin(deg2rad(r(5))) * sin(deg2rad(r(6)));
a3=cos(deg2rad(r(4))) * cos(deg2rad(r(5)));
n3=-sin(deg2rad(r(5)));
s3 = cos(deg2rad(r(5))) * sin(deg2rad(r(4)));

PWx_end_effector=r(1);
PWy_end_effector=r(2);
PWz_end_effector=r(3);

% PW não é o do end effector, dai ser preciso ajustar isto

PWx=PWx_end_effector-Lf*a1;
PWy=PWy_end_effector-Lf*a2;
PWz=PWz_end_effector-Lf*a3;


%-------------------------Cálculo dos thetas-------------------------------

%Calculo de theta1

theta1 = atan2(PWy,PWx);


%Calculo de theta3

A=2*Lc*Ld;
B=2*Lc*Le;
C=(PWx*cos(theta1) - Lb + PWy*sin(theta1))^2 + PWz^2 - Lc^2 - Ld^2 - Le^2;

theta3=2*atan2((B+red_theta3*sqrt(B^2+A^2-C^2)),A+C);

%Calculo do theta2

const1 = Lc + Ld*cos(theta3) + Le*sin(theta3);
const2 = Le*cos(theta3) - Ld*sin(theta3);

cos_theta2 = ( const2 *(red_theta2 * sqrt(PWx^2+PWy^2) - Lb) + const1*PWz) / (const1^2+const2^2);

sin_theta2 = ( const1 * const2 *(red_theta2 * sqrt(PWx^2+PWy^2) - Lb) - const2^2*PWz)/(const2*const1^2 + const2^3);


theta2 = atan2(sin_theta2,cos_theta2);


%Cálculo das matrizes para os ultimos 3 thetas


o_T_e=trans3(r(1),r(2),r(3))*rotz(deg2rad(r(6)))*roty(deg2rad(r(5)))*rotx(deg2rad(r(4)));
DH_matrix = [ theta1+pi/2     pi/2     0     La
                     pi/2         pi/2     0     Lb
                    theta2         pi      Lc    0 
                    theta3        pi/2     Ld    0 
                      0            pi      0     Le ];
   
%   Sequência de transformações desde a origem (O) até ao gripper (G)
    OTG = GetOTG(DH_matrix);
    
    w_T_e=inv(OTG)*o_T_e;

aa1=w_T_e(1,3);
aa2=w_T_e(2,3);
aa3=w_T_e(3,3);
ss3=w_T_e(3,2);
nn3=w_T_e(3,1);


%Calculo do theta5

sin_theta5=(red_theta5*sqrt(aa1^2+aa2^2));
%sin_theta5=(red_theta5*sqrt(n3^2+s3^2));
cos_theta5=-aa3;

theta5=atan2(sin_theta5,cos_theta5);

%Calculo do theta4
theta4=atan2(aa2*sin(theta5),aa1*sin(theta5));


%Calculo do theta6

theta6=atan2(ss3*sin(theta5),nn3*sin(theta5));



%Correção da interação entre a junta 2 e 3
theta3 = theta3 - theta2;


DH =               [theta1+pi/2     pi/2      0     La
                    pi/2            pi/2      0     Lb
                    theta2          pi        Lc    0 
                    theta3          pi/2      Ld    0 
                      0             pi        0     Le 
                    theta4          pi/2      0     0
                    theta5          -pi/2     0     0
                    theta6          pi        0     -Lf];




%Conversão do espaço de juntas para graus

theta1_deg=rad2deg(theta1);

theta2_deg=rad2deg(theta2);

theta3_deg=rad2deg(theta3);

theta4_deg=rad2deg(theta4);

theta5_deg=rad2deg(theta5);

theta6_deg=rad2deg(theta6);




end