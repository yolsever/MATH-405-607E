clc
clear all
h_results = [];
error_results = [];

for k = 0:.5:8
    h = 10^(-k);
    x = 0:h:(1-h);  x = x';
    u = (sin(1.2 + h) - 2*sin(1.2) + sin(1.2-h))/h^2;
    uxx_exact = -sin(1.2);
    h_results = [h_results h];
    error_results = [error_results norm(u - uxx_exact, inf)];
end
loglog(h_results,error_results) %for loglog plots