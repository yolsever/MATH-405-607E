function r = solveq6(t,u)

mu = 0.012277471;
mubar = 1- mu;

y1 = u(1);
y2 = u(2);
y1p = u(3);
y2p = u(4);

D1 = ((y1+mu)^2 + y2^2)^(3/2);
D2 = ((y1-mubar)^2 + y2^2)^(3/2);

r = [y1p; y2p; y1 + 2*y2p - mubar * (y1 + mu)/D1 - mu*(y1 -mubar)/D2; y2 - 2*y1p - mubar * y2 / D1 - mu * y2 / D2];

end