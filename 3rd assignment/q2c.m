clc
clear all

format long g

xk = [0 1 3];

f = [15 8 0];

x = 0;

beta = bary(xk, x);
finterp = sum(beta .* f);