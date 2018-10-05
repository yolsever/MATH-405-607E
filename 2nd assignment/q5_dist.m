function obj = dist(X)
  N = 40;
  u = u_approx(X);
  uu = u([1 0.1*N+1 0.2*N+1 0.4*N+1 0.6*N+1 0.8*N+1 0.9*N+1]);
  obj = norm(uu' - [0 0 0 0 1 1 1], 2);
end