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
Dxx = Dxx/h^2;
f = -4*pi^2*e.^(sin(2*pi*x)).*(sin(2*pi*x)-cos(2*x*pi).*cos(2*pi*x)-1);
u_exact = e.^sin(2*pi*x);
u_approx = (Dxx-eye(m)) \ f;
h_results = [h_results h];
error_results = [error_results norm(u_approx - u_exact, inf)];
end
loglog(h_results,error_results)
