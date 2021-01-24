function J1 = inv_jac(thetas,L)

theta1=thetas(1);
theta2=thetas(2);
L1=L(1);
L2=L(2);

J1=(1/(L1*sin(theta2)))*[cos(theta1+theta2)                             sin(theta1+theta2)
                         (-L1*cos(theta1)-L2*cos(theta1+theta2))/L2     (-L1*sin(theta1)-L2*sin(theta1+theta2))/L2 ];



end