clc
clear all

fx1 = [8 9 7 10];
fx2 = [3 6 10 9];
fx3 = [1 1 10 3];
fx4 = [4 8 1 0];

xk = [0 1 2 3];
yk = [0 1 2 3];

x= 3;
y= 2;

betax = bary(xk, x);
finterpx1 = sum(betax .* fx1);
finterpx2 = sum(betax .* fx2);
finterpx3 = sum(betax .* fx3);
finterpx4 = sum(betax .* fx4);

fint = [finterpx1 finterpx2 finterpx3 finterpx4];
 
betay = bary(yk,y);
q = sum(fint .* betay);
