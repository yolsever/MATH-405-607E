% this script implements Euler's method for the problem y'= f(t,y)
% below. The time values are stored in the vector t with corresponding y 
% values stored in vector y_euler.

clear all

N=12; % choose number of Euler steps

% set start and end times for the problem
endtime = 3;
starttime = 0;
initial_condition = 1; % this should be y(starttime) for the problem

% RHS function (set to an example y'=y+t)
f=@(t,y) (t-1)*y;

% define the step size h
h=(endtime-starttime)/N;

% now set the first elements of y_euler and t equal to their starting values
y_euler(1)=initial_condition;
t(1)=starttime;

% this loop implements the Euler method described in class

for k=1:N
    t(k+1)=t(k)+h;
    y_euler(k+1)=y_euler(k)+h*f(t(k),y_euler(k));
end


% now plot the solution

plot(t,y_euler)

hold on

