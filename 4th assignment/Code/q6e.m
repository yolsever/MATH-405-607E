clear all
clc
h_results = [];
error_results = [];
A = [1/64 1/128 1/256 1/512];
for h = A

x = (0:h:(1-h))';   % interior pts

m = length(x);

e = ones(1, m)';
Dxx = spdiags([e -2*e e], [-1 0 1], m, m);
Dxx(1,m) = 1;
Dxx(m,1) = 1;

%full(Dxx)

Dxx = Dxx/h^2;

% RHS function
f = -4*pi^2*e.^(sin(2*pi*x)).*(sin(2*pi*x)-cos(2*x*pi).*cos(2*pi*x)-1);

% exact soln for comparing/plotting
u_exact = e.^sin(2*pi*x);

% solve Dxx*U = F for U
u_approx = Dxx \ f;

h_results = [h_results h];
error_results = [error_results norm(u_approx - u_exact, inf)];
end
loglog(h_results,error_results)
