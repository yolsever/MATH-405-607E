tic
r = 3.75; x0 = chebfun('x',[0 1]);
n = 15; x = x0;
for k = 1:n, x = r*x.*(1-x); end
LW = 'linewidth'; FS = 'fontsize';
plot(x,LW,1)
ss = sprintf('r=%4.2f     n=%d     length(x)=%d', r, n, length(x));
title(ss,FS,12), axis([0 1 0 1])