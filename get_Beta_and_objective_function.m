clc
clear all
close all

s1 = 100;
s2 = 400;
alpha = 0.2;
D1 = 50;
D2 = 550;
C1 = 2000;
C2 = 2000;
% mode = 'demand';
beta12 = 0;
beta21 = 0:0.01:1;
if beta21==0
    betaVariable = beta12;
else
    betaVariable = beta21;
end
[f,objective_function,gamma1,gamma2,flow_out]= objective_function_beta(beta12,beta21,s1,s2,C1,C2,D1,D2,alpha);
%[f,g,gamma1,gamma2,flow_out]...
%         = objective_function_beta_capacity(beta12,beta21,s1,s2,C1,C2,D1,D2,alpha);
%[f,g,gamma1,gamma2,flow_out]=objective_function_beta_supply_capacity(beta12,beta21,s1,s2,C1,C2,D1,D2,alpha);

% Need to find a rule to pick one beta
%beta_optimal_idx_set=find(objective_function==min(objective_function));
sum_gamma=gamma1+gamma2;
beta_optimal_idx_set=find(sum_gamma==max(sum_gamma));
beta_optimal_idx = min(beta_optimal_idx_set);
beta_optimal=betaVariable(beta_optimal_idx);
objective_function_optimal = objective_function(beta_optimal_idx);
gamma1_at_beta_optimal =gamma1(beta_optimal_idx);
gamma2_at_beta_optimal =gamma2(beta_optimal_idx);

figure
[haxes,hline1,hline2] =plotyy(betaVariable,flow_out,betaVariable,objective_function);
set(hline1,'LineWidth',2);
set(hline2,'LineWidth',2);

legend('f^{out}_1+f^{out}_2','|f^{out}_1/s_1-f^{out}_2/s_2|')
title(sprintf('s_1=%d, s_2=%d, D_1=%d, D_2=%d, alpha=%3.2f, C_1=%d, C_2=%d, beta^o=%3.2f',s1,s2,D1,D2,alpha,C1,C2,beta_optimal))
if beta21==0
    xlabel('\beta_{12}')
else
    xlabel('\beta_{21}')
end

figure
plot(betaVariable,gamma1,'b','linewidth',2)
hold on
plot(betaVariable,gamma2,'r','linewidth',2)
plot(betaVariable,gamma1+gamma2,'k')
legend('\gamma_1','\gamma_2','\gamma_1+\gamma_2')
xlim([0,1])
ylim([0,2])
hold on
plot(beta_optimal,gamma1_at_beta_optimal,'k*')
hold on
plot(beta_optimal,gamma2_at_beta_optimal,'k*')
title(sprintf('s_1=%d, s_2=%d, D_1=%d, D_2=%d, alpha=%3.2f, C_1=%d, C_2=%d, beta^o=%3.2f',s1,s2,D1,D2,alpha,C1,C2,beta_optimal))
if beta21==0
    xlabel('\beta_{12}')
else
    xlabel('\beta_{21}')
end


