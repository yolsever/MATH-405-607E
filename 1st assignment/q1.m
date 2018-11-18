%% heat equation approximate solution
% $u_t = u_{xx}$
% on $x \in [0, 1)$ with periodic boundary conditions
% and initial condition of u(x, 0) = sin(2*pi*x)
clc
clear all
%close all

h_results = [];
error_results = [];

%% grid
% for N = [10 20 40 80 160] % errors
 for N = [4 8 16 32] %loglog
% for N = [8 16 32 64 128 256] %polyfit
%for h = 2.^(-(3:8)) 
%for h= 2.^(-(2:5)) 
%N = 1/h;
h= 1/N;
x = linspace(0,1,N);  x = x';
e = ones(size(x));

%% initial condition
u0 = sin(2*pi*x);
%% figure(1); clf;
%% plot(x, u0, 'r-x')

%% spatial operator
L = spdiags([e -2*e e], [-1 0 1], N, N);
L(1, N) = 1;
L(N, 1) = 1;
L = (1/h^2)*L;

%% time
Tf = 0.25;
k = 0.25*h^2;
numsteps = ceil(Tf/k);
k = Tf/numsteps;
%% u_exact = @(x,t) exp(-a^2*pi^2*t)*sin(a*pi*x)
u_exact = sin(pi*x);
f= (-1-pi^2)*sin(pi*x);

u_approx = f \ (L-eye);

 h_results = [h_results h];
 error_results = [error_results norm(u_approx - u_exact, inf)];
 
end
%%
 loglog(h_results,error_results)
% p = polyfit(log(h_results),log(error_results),1)
% hold on
%p = polyfit(log(error_results),log(h_results),1)
 