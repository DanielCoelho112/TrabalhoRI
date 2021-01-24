function Jacob=inv_jac_RR(theta1,theta2,L1,L2)
%   Função para calcular o espaço de juntas sabendo o espaço cartesiano


const=1/(L1*sin(theta2));
Jacob=const*[cos(theta1+theta2) sin(theta1+theta2)
             (-L1*cos(theta1)-L2*cos(theta1+theta2))/L2 (-L1*sin(theta1)-L2*sin(theta1+theta2))/L2];

end