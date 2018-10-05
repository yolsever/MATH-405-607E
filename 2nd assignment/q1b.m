%% q1
clear all

format long
%% Newton demo

f = @(x) x.^3 - 5;
fp = @(x) 3*x.^2;

%x0 = 0
x0 = 12;

xk = x0;
exact_root = 1.70997594667669698935310887254386;
errors = [];
n_s = [];

for i = 1:12
    xnew = xk - f(xk) / fp(xk);
    error = abs(exact_root - xnew);
    n_s = [n_s i];
    errors = [errors error];
    xk = xnew;
end

plot(n_s, errors)