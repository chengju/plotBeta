function getBetaPlot(s1,s2,D1,D2,alpha)
gridwidth = 0.01;
[beta12,beta21] = meshgrid(0:gridwidth:1,0:gridwidth:1);
figure
f_beta = objective_function_beta(beta12,beta21,s1,s2,D1,D2,alpha);
pcolor(beta12,beta21,f_beta)
xlabel('\beta_{12}')
ylabel('\beta_{21}')
title(sprintf('|d_1/s_1-d_2/s_2| \n s_1=%d, s_2=%d, D_1=%d, D_2=%d, alpha=%3.2f',s1,s2,D1,D2,alpha))
contourcbar

figure
f_beta_diff = objective_function_beta_diff(beta12,beta21,s1,s2,D1,D2,alpha);
pcolor(beta12,beta21,f_beta_diff)
xlabel('\beta_{12}')
ylabel('\beta_{21}')
title(sprintf('|(s_1-d_1)-(s_2-d_2)| \n s_1=%d, s_2=%d, D_1=%d, D_2=%d, alpha=%3.2f',s1,s2,D1,D2,alpha))
contourcbar