X0 = [0.6 0 0 0 0 -0.8 0 0 0];
[X, fval] = fminsearch(@(X) dist(X), X0);
options = optimset('PlotFcns',@optimplotfval);
figure
plot(X, u_app(X), 'r')
hold on
plot([0 0.1 .2 .4 .6 .8 .9], [0 0 0 0 1 1 1], '--b')