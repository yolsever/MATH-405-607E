function s = demo_04_adaptive_simpson(f, a, b, tol, nmax)
%DEMO_04_ADAPTIVE_SIMPSON  Adaptive quadrature with Simpson's rule
%   S = DEMO_04_ADAPTIVE_SIMPSON(F, A, B, TOL, NMAX) computes an
%   approximation to the integral of F on the interval [A, B].  It
%   will take a maximum of NMAX refinement steps in attempting to
%   determine the integral to a tolerance of TOL.  If omitted, NMAX
%   will default to 18.
%
%   The function uses an adaptive Simpson's rule.

  if (nargin < 5)
    nmax = 18;
  end

  % Evaluate the function at the endpoints
  fa = feval(f, a);
  fb = feval(f, b);

  % Initial integration step
  h = (b - a)/2;

  oddsum = feval(f, a+h);
  evensum = 0;

  sold = inf;  % we have no old value yet

  % Loop over stages of step-halving
  for i = 1:nmax
    % Simpson's rule
    s = h*(fa + fb + 4*oddsum + 2*evensum)/3;

    % Error Estimator
    err = abs(s - sold);

    % Output some diagnostics
    str = ['Step ' num2str(i) ' integral is ' num2str(s,'%15.10f')];
    if (i > 1)  % error estimate not reliable yet
      str = [str ', with error estimate ' num2str(err)];
    end
    str = [str '.'];
    disp(str)
    % pause

    if ((i > 1) && (err < 16*tol/15))
      % i > 1 b/c error estimate is not reliable yet
      disp(['Successful termination at iteration ' num2str(i) '.'])
      return
    end

    % Refine
    h = h/2;

    % Update evensum, oddsum for next step
    % (non-vectorized code: probably more efficiency possible)
    evensum = evensum + oddsum;
    oddsum = 0;
    for j = 1:2^i,
      oddsum = oddsum + feval(f, a+(2*j-1)*h);
    end

    sold = s;
  end

  % If we get this far, more than nmax stages have been used
  disp('*** Unsuccessful termination: maximum iterations exceeded ***');
  disp(['The integral *might* be ' num2str(s,'%15.10f') '.'])
