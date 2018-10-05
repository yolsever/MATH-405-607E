function u0 = init_u0(X, x)
  u0 = X(1)*ones(size(x));
  u0 = u0 + X(2)*cos(2*pi*x) + X(6)*sin(2*pi*x);
  u0 = u0 + X(3)*cos(4*pi*x) + X(7)*sin(4*pi*x);
  u0 = u0 + X(4)*cos(6*pi*x) + X(9)*sin(6*pi*x);
  u0 = u0 + X(5)*cos(8*pi*x) + X(10) * sin(8*pi*x);
end