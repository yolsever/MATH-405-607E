clear all
clc
h_results = [];
error_results = [];
A = [1/64 1/128 1/256 1/512];
for h = A

x = (h:h:(1-h))';   % interior pts

m = length(x);

e = ones(1, m)';
Dxx = spdiags([e -2*e e], [-1 0 1], m, m);
Dxx = Dxx/h^2;
% RHS function
f = (-1-pi^2)*cos(pi*x);
% exact soln for comparing/plotting
u_exact = cos(pi*x);
% solve Dxx*U = F for U
u_approx = (Dxx-eye(m)) \ f;
h_results = [h_results h];
error_results = [error_results norm(u_approx - u_exact, inf)];
end
loglog(h_results,error_results)
