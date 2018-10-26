clc
clear all

fx1 = [8 9 7 10];
fx2 = [3 6 10 9];
fx3 = [1 1 10 3];
fx4 = [4 8 1 0];

xk = [0 1 2 3];
yk = [0 1 2 3];

% x= 1.5;
% y= 1.5;

x_s= linspace(0,3,100);
y_s= linspace(0,3,100);
z_s= ones(100,100);

[rx,cx] = size(x_s);
[ry,cy] = size(y_s);
% [X, Y] = meshgrid(x_s,y_s);

for x= 1:cx
    for y= 1:cy
        betax = bary(xk, x_s(x));
        finterpx1 = sum(betax .* fx1);
        finterpx2 = sum(betax .* fx2);
        finterpx3 = sum(betax .* fx3);
        finterpx4 = sum(betax .* fx4);

        fint = [finterpx1 finterpx2 finterpx3 finterpx4];
 
        betay = bary(yk,y_s(y));
        z_s(x,y)  = sum(fint .* betay);
    end
end
shading interp
surf(x_s,y_s,z_s)
colorbar