clear all
clc
%% heat equation approximate solution
% $u_t = u_{xx}$
% on $x \in [0, 1)$ with periodic boundary conditions
%% grid
N = 40;
theta = linspace(0,pi,N+1);
theta = theta(1:N);
x = (-cos(theta)+1) /2;

for i=2:(N-1)
    h(i) = x(i+1) - x(i);
    him1(i) = x(i) - x(i-1);
    L(i,i) = -2 / (him1(i) * h(i));
    L(i,i-1) = 2 / (him1(i)^2 + him1(i) * h(i));
    L(i,i+1) = 2 / (h(i) * him1(i) + h(i) ^2);
end

L(1,1) = -2 / (him1(1) * h(1));
L(1,2) = 2 / (h(1) * him1(1) + h(1) ^2);
L(40,:) = 0;
L(40,39) = 2 / (him1(39)^2 + him1(39) * h(39));
L(40,40) = 2 / (him1(39)^2 + him1(39) * h(39));

u = sin(2*pi*x);
uxx_exact = -4*cos(2*pi*x);
uxx = L.*u;
plot(x,uxx);
% plot(x,uxx_exact)

h_j = max(h); %index 20

errors = [];
for i=1:10
    for i=2:(N-1)
    h(i) = x(i+1) - x(i);
    him1(i) = x(i) - x(i-1);
    h(20) = 2 * h(20);
    L(i,i) = -2 / (him1(i) * h(i));
    L(i,i-1) = 2 / (him1(i)^2 + him1(i) * h(i));
    L(i,i+1) = 2 / (h(i) * him1(i) + h(i) ^2);
    end
    uxx = L.*u;
    errors = [errors norm(uxx - uxx_exact, inf)];
end
