%% Example of a stiff problem using ode45
% demo by Aili Shao, 2017.
%
% ode45 is based on an explicit Runge-Kutta (4,5) formula,
% the Dormand-Prince pair.  It is a single-step solver
% in computing u(tn), it needs only the solution at the
% immediately preceding time point, u(tn-1).
%
% Note that ode45 is usually used to solve nonstiff
% differential equations
%
% First ode45 applied to:
%    u' = -sin(t)
%
% Then ode45 applied to:
%    u' = -100(u-cos(t)) - sin(t)

%%
% non-stiff problem
rhs = @(t,u) -sin(t)

%%
% and similar but stiff u'=-100(u-cos(t)) - sin(t)
rhsstiff = @(t,u) -100*(u-cos(t))-sin(t)

%%
tspan= [0 1];
% Choose random initial conditions
N = 10;
u0 = 2*rand(N,1);
figure(1); clf;
figure(2); clf;


for i=1:N
  [t, u] = ode45(rhs, tspan, u0(i));
  figure(1)
  plot(t, u); hold on;
  pause
end
for i=1:N
  [t, unew]= ode45(rhsstiff, tspan, u0(i));
  figure(2)
  plot(t, unew); hold on;
  pause
end
