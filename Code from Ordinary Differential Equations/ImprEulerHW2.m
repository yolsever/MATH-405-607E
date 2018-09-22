% this script implements Improved Euler for the problem y'= f(t,y)
% below. The time values are stored in the vector t with corresponding y 
% values stored in vector y_IE.

clear all

N=12; % choose number of steps

% set start and end times for the problem
endtime = 3;
starttime = 0;
initial_condition = 1; % this should be y(starttime) for the problem

% RHS function (set to an example y'=y+t)
f=@(t,y) (t-1)*y;

% define the step size h
h=(endtime-starttime)/N;

% now set the first elements of y_IE and t equal to their starting values
y_IE(1)=initial_condition;
t(1)=starttime;

% this loop implements the Improved Euler method described in class

for k=1:N
    t(k+1)=t(k)+h;
    y_IE(k+1)=y_IE(k)+(h/2)*(f(t(k),y_IE(k))+f(t(k+1),y_IE(k)+h*f(t(k),y_IE(k))));
end

% plot the solution

plot(t,y_IE)
hold on

y_exact=@(t) exp(t^2/2-t)

ezplot(y_exact,[0 1])

abs(y_IE(N+1)-y_exact(endtime))