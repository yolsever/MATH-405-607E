%% Composite integration demo

f = @(x) sin(x);
%f = @(x) exp(sin(x));

a = -4; b = 4;
%a = 0; b = 2*pi;

% (we generally don't know this!)
Iexact = 2;
% call Octave/Matlab quadrature routine:
%Iexact = quad(f, a, b, 1e-15)

% to see the expected conv rate double n (halve h)
n = 2^3;  % even, see "2n" in the notes


h = (b-a)/n

fa = f(a);
fb = f(b);

%% trap
xmid = a + h*(1:(n-1));
I_trap = h/2 * (fa + fb + 2*sum(f(xmid)))

%% simpson
xeven = a + h*(2:2:(n-1));
xodd = a + h*(1:2:(n-1));
f_odd = f(xodd);
f_even = f(xeven);
I_simp = h/3 * sum([fa fb 4*f(xodd) 2*f(xeven)])

err_trap = I_trap - Iexact
err_simp = I_simp - Iexact
