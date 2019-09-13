function [L,C] = findlc_manami(f,idx,R,ser_par)
if idx == 1
    x = input('RC or RL circuit? [RC/RL] :','s');
    switch x
        case 'RC'
            C = f.tau/R;
        case 'RL'
            L = f.tau*R;
    end
else
    [a,w] = find_aw_manami(f,idx);
    x= ser_par;
    switch x
        case 'Series'
            L=R/(2*a);
            C=1/(L*w^2);
        case 'Parallel'
            C=1/(2*a*R);
            L=1/(C*w^2);
    end
end