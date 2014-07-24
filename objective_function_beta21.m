function f = objective_function_beta21(beta21,s1,s2,D1,D2,alpha)
% this is the objective function of the mode beta12 ~= 0 and beta21 = 0
D2H = alpha*D2;
d1 = D1+beta21*D2H;
d2 = -beta21*D2H+D2;
f = abs(d1/s1-d2/s2);