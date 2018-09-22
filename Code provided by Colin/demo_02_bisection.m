%% Bisection demo

f = @(x) x.^5 - 3*x + 1/2

% show more digits
format long g

a = -20;
b = 10;

assert (f(a)*f(b) < 0)

% exact answer (from where?)
exact = -1.35480588820312
clf;
xlabel('k')
ylabel('err')

tol = 1e-13

k = 0
while (abs(b-a) > tol)
  k = k + 1;
  m = (a+b)/2;
  xk = m;
  err = abs(xk - exact)   % normally would not know this!
  if (f(m)*f(a) < 0)
    b = m;
  else
    a = m;
  end
  semilogy(k, err, 'ko')
  xlabel('k')
  ylabel('err')
  hold on;
  drawnow
end

plot([1 50], 0.5.^[1 50], 'r--')
