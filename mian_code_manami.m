clear;
close all;
clc;
format long;
global gofMat_table;
global t;
global y;
global eqn;
t = linspace(0,10,1000);
y = exp(-2.5*t).*(10*cos(1.6583*t)-15.076*sin(1.6583*t));
eqn = ["init*exp(-x/tau)";"A1*exp(s1*x)+A2*exp(s2*x)";"(A2+A1*x)*exp(-a*x)";"exp(-a*x)*(A1*cos(w*x)+A2*sin(w*x))"];
gofMat = myplot_manami(eqn,t,y);
gofMat_table=table2array(struct2table(gofMat));
run('gofMatexp1.m');



