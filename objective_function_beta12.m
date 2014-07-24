function f = objective_function_beta12(beta12,s1,s2,D1,D2)
% this is the objective function of the mode beta12 ~= 0 and beta21 = 0
d1 = (1-beta12)*D1;
d2 = beta12*D1+D2;
f = abs(d1/s1-d2/s2);