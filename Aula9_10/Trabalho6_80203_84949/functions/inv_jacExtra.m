function J1 = inv_jacExtra(thetas,L)

theta1=thetas(1);
theta2=thetas(2);

LA=L(1);
LB=L(2);

J = [-LB*sin(theta1)*cos(theta2) -LB*cos(theta1)*sin(theta2)
      LB*cos(theta1)*cos(theta2) -LB*sin(theta1)*sin(theta2)
      0 LB*cos(theta2)];
  
J1 = pinv(J); 

end