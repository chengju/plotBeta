function f = objective_function_beta_capacity(beta12,beta21,C1,C2,D1,D2,alpha)
D2H = alpha*D2;
d1 = (1-beta12)*D1+beta21*D2H;
d2 = beta12*D1-beta21*D2H+D2;
% gamma1 = s1./d1;
% gamma2 = s2./d2;
gamma1 = 1;
gamma2 = 1;
% f = abs((d1/s1)-(d2/s2));
f = abs(((gamma1*d1)/C1)-((gamma2*d2)/C2));