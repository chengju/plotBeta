function [ beta12,beta21,gamma1,gamma2 ] = get_beta_two_two( s1,s2,D1,D2,alpha,C1,C2 )
D2H = alpha*D2;

%% input check
if s1<0 || s2<0 || D1<0 ||D2<0 || C1<0 ||C2<0
    disp('Error! flow cannot be negative!')
end

if alpha<0 ||alpha>1
    disp('Error! alpha is not in [0,1] !')
end


%% calculate beta
if (s1+s2>D1+D2) || (s1+s2==D1+D2)
    if s1==0 && s2>0
        beta12=1;
        beta21=0;
        
    elseif s2==0  && s1>0
        beta12=0;
        beta21=1;
        
    elseif s1==0 && s2==0
        beta12=0;
        beta21=0;
        
    elseif (D1/s1) == (D2/s2)
        beta12=0;
        beta21=0;
        
    elseif ( (D1/s1) < (D2/s2) ) && (alpha>0)
        beta12=0;
        beta21= min(1, (s1*D2-s2*D1)/((s1+s2)*D2H));
        
    elseif ( (D1/s1) < (D2/s2) ) && (alpha==0)
        beta12 =0;
        beta21 =0;
        
    elseif ( (D1/s1) >(D2/s2) ) && ((alpha>0)||(alpha==0))
        beta21 =0;
        beta12 =min(1, (s2*D1-s1*D2)/((s1+s2)*D1));
        
    end
    
elseif (s1+s2<D1+D2)
    if s1==0 && s2>0
        beta12 =1;
        beta21 =0;
        
    elseif s2==0  && s1>0
        beta12 =0;
        beta21 =1;
        
    elseif s1==0 && s2==0
        beta12 =0;
        beta21 =0;
        
    elseif (D1/s1) == (D2/s2)
        beta12 =0;
        beta21 =0;
        
    elseif ( (D1/s1) < (D2/s2) ) && (alpha>0)
        beta12 =0;
        beta21 =min(1, (s1*D2-s2*D1)/((s1+s2)*D2H));
        
    elseif ( (D1/s1) < (D2/s2) ) && (alpha==0)
        beta12 =0;
        beta21 =0;
        
    elseif ( (D1/s1) >(D2/s2) ) && ((alpha>0)||(alpha==0))
        beta21 =0;
        beta12 =min(1, (s2*D1-s1*D2)/((s1+s2)*D1));
        
    end
    
end

[gamma1,gamma2] = get_gamma(beta12,beta21,s1,s2,D1,D2,D2H,C1,C2 );

end


%% calculate gamma1 and gamma2
function [gamma1,gamma2] = get_gamma(beta12,beta21,s1,s2,D1,D2,D2H,C1,C2 )

if beta12==0
    gamma1 =min(1, s1/(D1+beta21*D2H));
    gamma2 =min(1, s2/(-beta21*D2H+D2));
elseif beta21==0
    gamma1 =min(1, s1/((1-beta12)*D1));
    gamma2 =min(1, s2/(beta12*D1+D2));
end

end