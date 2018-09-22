%% approx the second derivative
%
%

N = 80;
h = 1/N;
x = 0:h:(1-h);  x = x';

e = ones(size(x));

u = sin(2*pi*x);

figure(1); clf;
plot(x, u, 'r-x')

L = spdiags([e -2*e e], [-1 0 1], N, N);
L(1, N) = 1;
L(N, 1) = 1;
L = (1/h^2)*L;

uxx_exact = -4*pi^2*sin(2*pi*x);
uxx = L*u;

hold on;
plot(x, uxx, 'bx-')
plot(x, uxx_exact, 'mo--')

legend('u', 'u_{xx} approx', 'u_{xx} exact')
