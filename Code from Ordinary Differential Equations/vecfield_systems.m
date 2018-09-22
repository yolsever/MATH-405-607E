% Plotting vector field and solution curves for SI model 
% from class November 17th

clear all; %start by clearing all variables
close all;
% now start making the vector plot
% first set up matrices X1 and X2 that contain the X1- and X2-
% coordinates. These correspond to S and I respectively

[X1, X2] = meshgrid(0:500:10000,0:500:10000);

% Define the RHS function:

b=500; d=.05; alpha=0.1; beta=0.05;

F1=@(x1,x2) b-d.*x1-beta.*x1.*x2./(x1+x2);
F2=@(x1,x2) beta.*x1.*x2./(x1+x2)-(alpha+d).*x2;

% create the vector field components

U1 = F1(X1,X2);
U2 = F2(X1,X2);

%Finally plot the vector field using the quiver command

quiver(X1,X2,U1,U2)



% observe that some of the arrows here are hard to see. This is because
% quiver() is rescaling the arrows. We can improve this
% by telling it to plot all the arrows with the same length:

figure(2); %change to figure 2

% the following loop rescales every arrow to length L=0.05
% note that U1 and U2 have to be matrices of the same size for this
% loop to work as written

L=200;
len=length(U1);
for(i=1:len)
    for(j=1:len)
        nr=sqrt(U1(i,j)^2+U2(i,j)^2);
        U1(i,j)=L*U1(i,j)/nr;
        U2(i,j)=L*U2(i,j)/nr;
    end
end

quiver(X1,X2,U1,U2,0) 
% the zero at the end of the arguments tells matlab not to rescale the
% vectors, so they keep the length L that was specified


% Next up: numerical solve the ODE for a given initial condition x(0)=(1,1).
% to use ode45() which is a good routine for numerical solution of ODE,
% we need to define the ODE as x'=f(t,x). We can use @-function for this as
% it is simple. If it's more complicated, then you should write a function
% file (see lecture one) that inputs t and x and outputs the derivatives.

% I can use F1 and F2 as defined above.

% to go into ode45, f needs to be a function of t and x in that order
% in this class we will only look at x'=f(t,x)=f(x) - that is, autonomous
% non linear systems. But matlab still needs us to specify the dependence
% on t.

f=@(t,x) [F1(x(1),x(2)); F2(x(1),x(2))];

% now I will set the initial point [S=10000,I=1]

ip=[10000;1];

% and the time range to run on. Lets go from t=0 to t=300:

tr=[0 300];

% now run ode45 and put the output into tout and xout:

[tout xout]=ode45(f,tr,ip);

% finally plot on the same axes. I have to plot one component of xout
% against the other component.

hold on; % prevent this graph from overwriting the vector plot.

plot(xout(:,1),xout(:,2))

% now plot components S and I
figure(3);

plot(tout,xout(:,1))

hold on;

plot(tout,xout(:,2))

plot(tout,xout(:,1)+xout(:,2))


legend('Susceptibles','Infecteds','Total population')
xlabel('Time since start of epidemic (years)')
ylabel('Number of people')