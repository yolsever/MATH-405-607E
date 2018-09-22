close all;
clear all;
clc;

A=[-2 1;2 -3]/100;
x
% setting up the homogeneous system
F1=@(x1,x2) A(1,1)*x1+A(1,2)*x2;
F2=@(x1,x2) A(2,1)*x1+A(2,2)*x2;
% now adding the forcing functions
f=@(t,x) [F1(x(1),x(2)); F2(x(1),x(2))+1];

% setting the time range and IC for ode45:
tr=[0:0.1:1000];
ic=[100;0];

% now run ode45 and put the output into tout and xout:
[tout xout]=ode45(f,tr,ic);

figure;

plot(tout,xout(:,1),'b','LineWidth',2.5);hold on;
plot(tout,xout(:,2),'r','LineWidth',2.5);
xlim([tr(1) tr(end)]);
%ylim([0 30]);
set(gca,'Fontsize',20);
xlabel('time (hr)','Fontsize',20); ylabel('C_{1},C_{2}','Fontsize',20);
legend('C_{1}','C_{2}');
%set(gca,'dataaspectratio',[1 1 1])
print -depsc 'two_tank_mixing_c2_100.eps';







