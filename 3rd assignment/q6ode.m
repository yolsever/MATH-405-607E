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
u_0 = [y10; y20; yp10; yp20];
hold on
[t,u] = ode45(@solveq6,[0 Tf],u_0);
hold on
% plot(u(:,1),u(:,3),'-r',u(:,2),u(:,4),'-o')   
plot(u(:,1),u(:,2),'b-')
hold on