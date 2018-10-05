%% q1
clear all
format long
%% Newton demo

f = @(x) x.^2 - 5;
fp = @(x) 2*x;

%x0 = 0
x0 = 12;

xk = x0;

% you should use a loop...
for i = 1:5
    xnew = xk - f(xk) / fp(xk);
    xk = xnew
    if abs(xk - 2.236067977499789) < 0.0000000000000009
        break
    end
end
% disp(xk);