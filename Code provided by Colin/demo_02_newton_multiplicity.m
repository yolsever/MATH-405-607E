%% Newton demo
% when root has multiplicity >= 2


% multiplicity is 4
f = @(x) (x-1).^4;
fp = @(x) 4*(x-1).^3;

x0 = 5

xk = x0;
xnew = inf;

tol = 1e-12;

%while (abs(xnew - xk) > tol)...
for k=1:50
  xnew = xk - f(xk) / fp(xk)
  xk = xnew;
end
