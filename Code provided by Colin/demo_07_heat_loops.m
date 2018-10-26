% explicit solution of heat eq  u_t = u_xx, with Dirichlet
% boundary data u(-1) = 0.871 and u(1) = 0.212.
% loop-based version

% Grid and initial data:
h = .025;                    % space step
k = .4*h^2;                  % time step (try .4 -> .51!)
x = (-1+h:h:1-h)';           % grid
v = abs(x-0.2)<.3;           % initial data: square wave
N = length(x);

figure(1); clf;
plt = plot(x, v, 'k.-', 'linewidth', 4);
axis([-1 1 -.01 1.01])
grid on
xlabel('x');  ylabel('u');

Tf = 0.25;
% adjust either final time or time-step to have integer steps
numsteps = ceil(Tf / k);
%k = Tf / numsteps
Tf = k*numsteps;

% Time-stepping:
for n=1:numsteps
  % loop over spatial points
  for j=1:N
    if j == 1
      % special case for Left BC
      vnew(j) = v(j) + k/(h^2)*(  ...
          0.871 - 2*v(j) + v(j+1)  ...
          );
    elseif j == N
      % special case for Right BC
      vnew(j) = v(j) + k/(h^2)*(  ...
          v(j-1) - 2*v(j) + 0.212  ...
          );
    else
      vnew(j) = v(j) + k/(h^2)*(  ...
          v(j-1) - 2*v(j) + v(j+1)  ...
          );
    end
  end
  v = vnew;
  set(plt, 'ydata', v)
  drawnow
  %pause
end
