clc
clear all

Tf = 17.0652165601579625588917206249;
k = Tf / 24000;  % desired time step
numsteps = floor(Tf / k);  % now adjust to have integer steps
k = Tf / numsteps;        % modified time step

yp20 = -2.00158510637908252240537862224;
y10 = 0.994;
yp10 = 0;
y20 = 0;
u = [y10 y20 yp10 yp20];
u_matrix = [];
for n = 1:numsteps
  res = solveq6(10,u);
  unew = u + k*res.';
  u_matrix = [u_matrix; unew];
  u = unew;
end
plot(u_matrix(:,1),u_matrix(:,2),'-r')