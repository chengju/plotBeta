clear
s1 =100;
s2 =20;
D1 =50;
D2 =40;
alpha=0.2;
C1 = 2000;
C2 = 2000;
[ beta12,beta21,g1,g2 ] = get_beta_two_two( s1,s2,D1,D2,alpha,C1,C2 );

% Effective demands
d1 = (1-beta12)*D1+beta21*(alpha*D2);
d2 = beta12*D1-beta21*(alpha*D2)+D2;

% output flow
f1out = g1*d1;
f2out = g2*d2;