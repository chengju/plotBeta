clc
clear all
close all

s1 = 100;
s2 = 400;
alpha = 0.2;
D1 = 200;
D2 = 400;
C1 = 2000;
C2 = 2000;
mode = 'demand';
beta12 = 0:0.01:1;
beta21 = 0;
betaVariable = beta12;
[f,g,gamma1,gamma2,flow_out]= objective_function_beta(beta12,beta21,s1,s2,C1,C2,D1,D2,alpha);
%[f,g,gamma1,gamma2,flow_out]...
%         = objective_function_beta_capacity(beta12,beta21,s1,s2,C1,C2,D1,D2,alpha);
%[f,g,gamma1,gamma2,flow_out]=objective_function_beta_supply_capacity(beta12,beta21,s1,s2,C1,C2,D1,D2,alpha);
figure
plotyy(betaVariable,flow_out,betaVariable,g)
legend('total outflow','obj. func.')
figure
plot(betaVariable,gamma1,'b')
hold on
plot(betaVariable,gamma2,'r')
legend('\gamma1','\gamma2')