clear all
clc

fun = @(x,y) exp(-((x-1.5).^2+(y-0.6).^2)*100);
q = integral2(fun,0,2,0,1);

a = 1/q;