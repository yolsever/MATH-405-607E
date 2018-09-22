%% Newton demo
% system example

% a given vector function ("anonymous function")
ff = @(x, y) [x.*y + y.^2 - 2;
              x.^3.*y - 3*x - 1];

% jacobian matrix, parallelizable across N^2 calc100 students
JJ = @(x, y) [y,  x + 2*y;
              3*x.^2.*y - 3,  x.^3];

% now x is a vector, rather than having x,y two scalars
f = @(x) ff(x(1), x(2));
J = @(x) JJ(x(1), x(2));


tol = 1e-12;

x0 = [10; 20]
%x0 = [-1.1; 2.2]

delta = [inf; inf];

xk = x0;
k = 0;
disp(xk')
while (norm(delta) > tol)
  k = k + 1;
  %% solve J(x_k) * delta = -f(x_k)
  % backslash solves Ax = b in a good way (probably Gaussian Elim)
  delta = J(xk) \ (-f(xk));
  xk = xk + delta;
  disp(xk')
end

% check
f(xk)
