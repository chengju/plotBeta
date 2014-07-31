function [f,g,gamma1,gamma2,flow_out]...
         = objective_function_beta_capacity(beta12,beta21,s1,s2,C1,C2,D1,D2,alpha)
D2H = alpha*D2;
d1 = (1-beta12)*D1+beta21*D2H;
d2 = beta12*D1-beta21*D2H+D2;
% gamma1 = min(1,C1/(C1+C2));
% gamma2 = min(1,C2/(C1+C2));
gamma1 = min(1,s1./d1);
gamma2 = min(1,s2./d2);
f = abs((d1./C1)-(d2./C2));
g = abs(((gamma1.*d1)/C1)-((gamma2.*d2)/C2)); % objective function
flow_out = gamma1.*d1+gamma2.*d2; % total out flow