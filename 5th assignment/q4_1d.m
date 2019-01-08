clc

J = 200;
h = 1/J;
x = (-4+h:h:4)';

f = zeros(size(x));

% I_c = (x >= -3) & (x <= -1) & (y >= -2) (y <= 1);
% I_w = 4/9*(x-3/2)^2 +(y-1)^2 <= 1;
% I_s = @(x) not(I_c) & not(I_w);

R = ones(size(x));

for i= 1:size(x)
    if (x(i) >= 0 && x(i) <= 3)
        R(i) = 1/2;
    end
end

iter = 10000;

f_new = zeros(size(f));

for j=1:iter
    for i= 2:(size(f)-1)
% I was setting the boundary conditions by hand then ignored them all
% together
%         if i == 2
%             f_new(i-1) = f(i)/2+h/2*(R(i-1)-f(i)/(2*h));
%         end
%         if i == size(f)-1
%             f_new(i+1) = f(i)/2+h/2*(R(i)-f(i)/(2*h));
%         end
        f_new(i) = (f(i+1)+f(i-1)) /2 + h/2* (R(i) - (abs(f(i+1)-f(i-1))) / (2*h));
        f = f_new;
    end
    if (mod(j, 50) == 0)
        plot(x, f, 'r-')
        xlabel('x'); ylabel('u')
        drawnow
    end
end