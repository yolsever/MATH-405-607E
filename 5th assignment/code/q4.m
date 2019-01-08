clear all
clc
    
J = 25;
h = 1/J;
x1d = (-4+h:h:4)';
y1d = (-3+h:h:3)';
[x, y] = meshgrid(x1d, y1d);

N = length(x);
M = length(y);
f = 0 .* x .* y

I_c = @(i,j) (x(i) >= -3) & (x(i) <= -1) & (y(j) >= -2) & (y(j) <= 1);
I_w = @(i,j) 4/9*(x(i)-3/2)^2 +(y(j)-1)^2 <= 1;
I_s = @(i,j) not(I_c(i,j)) & not(I_w(i,j));

R = ones(N,M);

for i= 1:size(x)
    for j = 1:size(y)
        if I_w(i,j)
            R(i,j) = 1/2;
        end
    end
end

iter = 130;

f_new = zeros(size(f));

for s=1:iter
    for i= 2:(N-1)
        for j = 2:(M-1)
% I was setting the boundary conditions manually then ignored them all
% together with recommendation from professor Macdonald
      
            [Dxx,Dyy,Dxc,Dyc,Dxb,Dyb,Dxf,Dyf,Dxyc] = diff2d_matrices(x1d,y1d,0,'p');
%             Dxc = (f(i+1,j)-f(i,j))/h;
%             Dyc = (f(i,j+1)-f(i,j))/h; 
            Dxcf = Dxc.*f;
            Dycf = Dyc.*f;
            f_new(i,j) = (f(i-1,j)+f(i+1,j)+f(i,j-1)+f(i,j+1))/4 + ...
                h/4*(R(i,j) - I_c(i,j) *(abs(Dxcf(i,j))+abs(Dycf(i,j))) - ...
                (I_s(i,j) | I_w(i,j)) * sqrt((Dxcf(i,j))^2+(Dycf(i,j))^2));
            f = f_new;
        end
    end
    if (mod(s, 10) == 0)
        contour(f)
        drawnow
        display(s)
    end
end