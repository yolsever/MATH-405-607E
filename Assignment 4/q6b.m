clear all
clc
h_results = [];
error_results = [];
A = [1/64 1/128 1/256 1/512];
for h = A
%x = (h:h:(1-h))';   % interior pts
N = h^(-1);
x = linspace(0, 1, N);
e = ones(1, N)';
Dxx = spdiags([e -2*e e], [-1 0 1], N, N);
%full(Dxx)
Dxx = Dxx/h^2;
% RHS function
f = 3.^x*(log(3)*log(3)-1);
f(1) = f(1) -1/h^2;
f(N) = f(N) -3/h^2;
f = f';
% exact soln for comparing/plotting
u_exact = 3.^x;
% solve Dxx*U = F for U
u_approx = (Dxx-eye(N)) \ f;
h_results = [h_results h];
error_results = [error_results norm(u_approx - u_exact, inf)];
end
loglog(h_results,error_results)
