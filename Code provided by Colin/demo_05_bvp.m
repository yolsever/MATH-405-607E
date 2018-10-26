%% solve a BVP on x \in [0, 1]
% Resulting error is 2nd-order (numerical evidence).
% u(0) = 0, and u(1) = 0
% But this does not follow directly from having 2nd-order LTE.

h = 1/8;

x = (h:h:(1-h))';   % interior pts

m = length(x);

e = ones(1, m)';
Dxx = spdiags([e -2*e e], [-1 0 1], m, m);

%full(Dxx)

Dxx = Dxx/h^2;

% RHS function
%f = exp(2*x) .* sin(8*pi*x);
f = sin(2*pi*x);

% exact soln for comparing/plotting
uex = -1/(4*pi^2)*sin(2*pi*x);
xfine = linspace(0, 1, 512);
uexfine = -1/(4*pi^2)*sin(2*pi*xfine);

% solve Dxx*U = F for U
u = Dxx \ f;

hf = figure(1); clf;
plot(xfine, uexfine, 'r-', 'linewidth', 3);
set(get(hf, 'children'), 'fontsize', 16)
hold on;
plot(x, uex, 'ro', 'linewidth', 2);
plot(x, u, 'kx-', 'linewidth', 2);

xlabel('x'); ylabel('u');
legend('exact soln', 'sampled exact', 'num soln');

%% can observe the global error
% can give numerical evidence of convergence
% (but not a proof)
err = max(abs(u - uex))


figure(2); clf;
plot(x, u - uex, 'kx', 'linewidth', 3);
xlabel('x'); ylabel('error');
legend('error vector')
grid on


%% Can also look at stability
% two-norm of the matrix inverse: seems bounded while changing h...
norm_inv = norm(inv(full(Dxx)),2)
% ... because the smallest-in-magnitude eigenvalue of Dxx if
% bounded away from zero (in fact close to pi^2 as in lecture)
min_eigval = min(abs(eig(full(Dxx))))
