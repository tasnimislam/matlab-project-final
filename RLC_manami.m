clear;
close all;
clc;
syms t s;
xt = 10*cos(100*pi*t);
tmin = input('First point of your plot:');
tmax = input('Last point of your plot:');
f = simplify(laplace(xt));
R=10e3;
L=40e-3;
C=100e-6;
v='Parallel'; 
switch v
    case 'Series'
        p = input('What do you want to find? [Vr/Vl/Vc/I] :','s');
        I= simplify(f/(R+s*L+1/(s*C)));
        switch p
            case 'I'
                yt = simplify(ilaplace(I));
            case 'Vr'  
                yt = simplify(ilaplace(I*R));
            case 'Vl'
                yt = simplify(ilaplace(I*s*L));
            case 'Vc'
                yt = simplify(ilaplace(I/(s*C)));
        end
    case 'Parallel'
        p = input('What do you want to find? [Ir/Il/Ic/V] :','s');
        switch p
            case 'V'
                yt=xt;
            case 'Ir'
                yt = simplify(ilaplace(f/R));
            case 'Il'
                yt = simplify(ilaplace(f/(s*L)));
            case 'Ic'
                yt = simplify(ilaplace(f*s*C));
        end
end
% fplot(xt,[tmin tmax]);
% hold on;
fplot(yt,[tmin tmax]);
hold on;
