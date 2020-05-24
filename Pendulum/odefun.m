function [dtheta_dt]= odefun(t,q,b,g,l,m)
theta1=q(1)
theta2=q(2)
first=theta2;
second=(-b/m)*theta2 - (g/l)*sin(theta1);
dtheta_dt=[first;second]

end