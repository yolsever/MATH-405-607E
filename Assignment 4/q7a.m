%% 2D Laplacian example with non-homogeneous boundary conditions

A = [32 64 128 256];
for N = A
hx = 1/N;
hy = 1/N;
x1d = 0:hx:2;
y1d = 0:hy:1;

[xx, yy] = meshgrid(x1d, y1d);
x = xx(:);
y = yy(:);

%% "method of manufactured solutions"
% Choose $u(x,y)$ then sub into PDE to find $f$
uexact_fcn = @(x, y) 1/(5*pi^2).*sin(pi.*x).*sin(2*pi.*y);
f_fcn = @(x, y) sin(pi.*x).*sin(2*pi.*y);
g = @(x,y) 0;

f = f_fcn(x, y);
uexact = uexact_fcn(x, y);

%% index sets for the boundaries
% note these operlap at the corners
b1 = (x == x1d(1));
b2 = (x == x1d(end));
b3 = (y == y1d(1));
b4 = (y == y1d(end));

%% Boundary condition vector for non-homogenous part
bc_rhs = zeros(size(x));
bc_rhs(b1) = bc_rhs(b1) + 2/hx^2*g(x(b1), y(b1));
bc_rhs(b2) = bc_rhs(b2) + 2/hx^2*g(x(b2), y(b2));
bc_rhs(b3) = bc_rhs(b3) + 2/hy^2*g(x(b3), y(b3));
bc_rhs(b4) = bc_rhs(b4) + 2/hy^2*g(x(b4), y(b4));

%% Right-hand side is f + boundary data
rhs = f + bc_rhs;

%% Sparse matrix to execute finite difference operation:
[Dxx, Dyy, Dxc, Dyc, Dxb, Dyb, Dxf, Dyf, Dxyc] = ...
  diff2d_matrices(x1d, y1d, 0, 'd');
L = Dxx + Dyy;

%% Solve
u = -L \ rhs;

%% Plots and error

rel_abs_err = norm(uexact - u, inf) / norm(uexact, inf)
end
