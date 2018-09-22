%% Newton demo

f = @(x) x.^5 - 3*x + 1/2
fp = @(x) 5*x.^4 - 3;

%x0 = 0
x0 = 0.8

xk = x0;

% you should use a loop...
xnew = xk - f(xk) / fp(xk), xk = xnew;
xnew = xk - f(xk) / fp(xk), xk = xnew;
xnew = xk - f(xk) / fp(xk), xk = xnew;
xnew = xk - f(xk) / fp(xk), xk = xnew;
xnew = xk - f(xk) / fp(xk), xk = xnew;
