function [theta1_deg,theta2_deg]=Cart2Joint_RR(r,red,L1,L2)
%   Função para calcular o espaço de juntas sabendo o espaço cartesiano


%-------------------------Cálculo dos thetas-------------------------------

%Calculo de theta2


theta2 = red * acos((r(1)^2+r(2)^2-L1^2-L2^2)/(2*L1*L2));

%Calculo de theta1


num=r(2)*(L1+L2*cos(theta2))-r(1)*(L2*sin(theta2))
den=r(1)*(L1+L2*cos(theta2))+r(2)*(L2*sin(theta2))
theta1 = atan2(num,dem)


%Conversão do espaço de juntas para graus

theta1_deg=rad2deg(theta1);

theta2_deg=rad2deg(theta2);

end