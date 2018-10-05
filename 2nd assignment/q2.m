clear all
clc
close all

x = -10:1:10;

L20 =  x.^2/3 - 4/3*x + 1;

L21  = -x.^2/2 +3/2*x ;

L22  = x.^2/6 - x/6;

plot(x,L20,x,L21,x,L22);

P2 = x.^2 - 8*x +15;

plot(x,P2)
