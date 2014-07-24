function f = objective_function_beta_diff(beta12,beta21,s1,s2,D1,D2,alpha)
D2H = alpha*D2;
d1 = (1-beta12)*D1+beta21*D2H;
d2 = beta12*D1-beta21*D2H+D2;
f = abs((s1-d1)-(s2-d2));