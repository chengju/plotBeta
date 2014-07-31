function getBetaPlot(s1,s2,D1,D2,C1,C2,alpha,mode)
gridwidth = 0.01;
[beta12,beta21] = meshgrid(0:gridwidth:1,0:gridwidth:1);

if strcmp(mode,'demand')
figure
f_beta = objective_function_beta(beta12,beta21,s1,s2,C1,C2,D1,D2,alpha);
%pcolor(beta12,beta21,f_beta)
surface(beta12,beta21,f_beta)
xlabel('\beta_{12}')
ylabel('\beta_{21}')
title(sprintf('|d_1/s_1-d_2/s_2| \n s_1=%d, s_2=%d, D_1=%d, D_2=%d, alpha=%3.2f',s1,s2,D1,D2,alpha))
contourcbar
end

if strcmp(mode,'capacity')
figure
f_beta = objective_function_beta_capacity(beta12,beta21,C1,C2,D1,D2,alpha);
%pcolor(beta12,beta21,f_beta)
surface(beta12,beta21,f_beta)
xlabel('\beta_{12}')
ylabel('\beta_{21}')
title(sprintf('|d_1/C_1-d_2/C_2| \n s_1=%d, s_2=%d, C_1=%d, C_2=%d, D_1=%d, D_2=%d, alpha=%3.2f',s1,s2,C1,C2,D1,D2,alpha))
contourcbar
end

if strcmp(mode,'supply-capacity')
figure
f_beta = objective_function_beta_supply_capacity(beta12,beta21,s1,s2,C1,C2,D1,D2,alpha);
%pcolor(beta12,beta21,f_beta)
surface(beta12,beta21,f_beta)
xlabel('\beta_{12}')
ylabel('\beta_{21}')
title(sprintf('|s_1d_1/C_1-s_2d_2/C_2| \n s_1=%d, s_2=%d, C_1=%d, C_2=%d, D_1=%d, D_2=%d, alpha=%3.2f',s1,s2,C1,C2,D1,D2,alpha))
contourcbar
end

if strcmp(mode,'diff')
figure
f_beta_diff = objective_function_beta_diff(beta12,beta21,s1,s2,D1,D2,alpha);
%pcolor(beta12,beta21,f_beta_diff)
surface(beta12,beta21,f_beta_diff)
xlabel('\beta_{12}')
ylabel('\beta_{21}')
title(sprintf('|(s_1-d_1)-(s_2-d_2)| \n s_1=%d, s_2=%d, D_1=%d, D_2=%d, alpha=%3.2f',s1,s2,D1,D2,alpha))
contourcbar
end

if strcmp(mode,'diff-capacity')
figure
f_beta_diff = objective_function_beta_diff_capacity(beta12,beta21,s1,s2,C1,C2,D1,D2,alpha);
%pcolor(beta12,beta21,f_beta_diff)
surface(beta12,beta21,f_beta_diff)
xlabel('\beta_{12}')
ylabel('\beta_{21}')
title(sprintf('|(s_1-d_1)/C_1-(s_2-d_2)/C_1| \n s_1=%d, s_2=%d, C_1=%d, C_2=%d, D_1=%d, D_2=%d, alpha=%3.2f',s1,s2,C1,C2,D1,D2,alpha))
contourcbar
end

end

