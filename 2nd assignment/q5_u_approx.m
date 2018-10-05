function u_app = u_approx(X)

  N = 40;
  h = 1/N;
  x = 0:h:(1-h);  x = x';
  e = ones(size(x));
  %% initial condition
  u0 = init_u0(X,x);
  figure(1); clf;
  plot(x, u0, 'r-x')
  %% spatial operator
  L = spdiags([e -2*e e], [-1 0 1], N, N);
  L(1, N) = 1;
  L(N, 1) = 1;
  L = (1/h^2)*L;
  %% time
  Tf = 0.05;
  k = 0.25*h^2;
  numsteps = ceil(Tf/k);
  k = Tf/numsteps;
  u = u0;
  for n=1:numsteps
    unew = u + k*(L*u);
    u = unew;
  end
  u_app = u;
