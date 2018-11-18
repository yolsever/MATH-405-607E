clear all
clc
% Grid and initial data:
h = .05;                    % space step
k = 0.8*h;                  % time step
x = (0:h:25)';           % grid
v0 = exp(-20*(x-2).^2) + exp(-(x - 5).^2);   
v1 = exp(-20*(x-k-2).^2) + exp(-(x-k-5).^2);
N = length(x);
Tf = 17;

figure(1); clf;
plt = plot(x, v0, 'k.-', 'linewidth', 4);
%axis([-1 1 -.01 1.01])
grid on
xlabel('x');  ylabel('u');

% adjust either final time or time-step to have integer steps
numsteps = ceil(Tf / k);
k = Tf / numsteps;

% Time-stepping:
for n=1:numsteps
  % loop over spatial points
  for j=1:N
    if n == 1
       if j == 1
      % special case for Left BC
       vnew(j) = - v1(j+1) / h * k + v0(j);
       elseif j == N
      % special case for Right BC
       vnew(j) = v1(j-1) / h * k + v0(j);
       else
       vnew(j) = (v1(j-1) - v1(j+1)) / h * k + v0(j);
       end
    else
        if j == 1
      % special case for Left BC
       vnew(j) = - v(j+1) / h * k + vold(j);
       elseif j == N
      % special case for Right BC
       vnew(j) = v(j-1) / h * k + vold(j);
       else
       vnew(j) = (v(j-1) - v(j+1)) / h * k + vold(j);
       end
       end
  end
  if n== 1
     v = vnew;
     vold = v1;
     set(plt, 'ydata', v)
     drawnow
  end
  if n ~= 1
     vold= v;
     v = vnew;
     set(plt, 'ydata', v )
     drawnow
  end
end
