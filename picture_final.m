function yt=picture(xt,fun,R,L,C,x,tf,p)
syms t real;
syms s;
switch x
    case 'RC'
        I = simplify(fun/(R+1/(s*C)));
        switch p
            case 'Ic'
                yt = ilaplace(I);
            case 'Vr'
                yt = ilaplace(I*R);
            case 'Vc'
                yt = ilaplace(I/(s*C));
            case 'Ic'
                yt = ilaplace(I);
        end
    case 'RL'
        
        I = simplify(fun/(R+s*L));
        switch p
            case 'Il'
                yt = ilaplace(I);
            case 'Vr'
                yt = ilaplace(I*R);
            case 'Vl'
                yt = ilaplace(I*s*L);
            case 'Ir'
                yt = ilaplace(I);
        end
    case 'Series'
        
        I= simplify(fun/(R+s*L+1/(s*C)));
        switch p
            case 'Il'
                yt = ilaplace(I);
            case 'Vr'
                yt = ilaplace(I*R);
            case 'Vl'
                yt = ilaplace(I*s*L);
            case 'Vc'
                yt = ilaplace(I/(s*C));
            case 'Ir'
                yt = ilaplace(I);
            case 'Ic'
                yt = ilaplace(I);
        end
    case 'Parallel'
        switch p
            case 'Vc'
                yt = xt;
            case 'Ir'
                yt = ilaplace(fun/R);
            case 'Il'
                yt = ilaplace(fun/(s*L));
            case 'Ic'
                yt = ilaplace(fun*s*C);
            case 'Vr'
                yt = xt;
            case 'Vl'
                yt = xt;
        end
end
xt=vpa(simplify(xt,'IgnoreAnalyticConstraints',true,'Steps',50),2);
yt=vpa(simplify(yt,'IgnoreAnalyticConstraints',true,'Steps',50),2);
