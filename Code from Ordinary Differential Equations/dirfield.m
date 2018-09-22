function dirfield(f,tval,yval)

f=@(x1,x2) 2*x1+
% dirfield(f, t1:dt:t2, y1:dy:y2)
%   
%   plot direction field for first order ODE y' = f(t,y)
%   using t-values from t1 to t2 with spacing of dt
%   using y-values from y1 to t2 with spacing of dy
%
%   f is an @ function
%     or the name of an m-file function of two variables with quotes.
%
% Example: y' = -y^2 + t
%   Show direction field for t in [-1,3], y in [-2,2], use
%   spacing of .2 for both t and y:
%
%   f = @(t,y) -y^2+t
%   dirfield(f, -1:.2:3, -2:.2:2)
%
% Source of this code:
% www.wam.umd.edu/~petersd/246/matlabode.html
% downloaded Jan 14, 2016
% Changes by D Coombs, Jan 8 2017, for compatibility with Octave
% @-functions. Compatibility with inline functions now uncertain.


[tm,ym]=meshgrid(tval,yval);
dt = tval(2) - tval(1); 
dy = yval(2) - yval(1);
%fvv = eval(vectorize(func2str(f)));
if isa(f,'function_handle')
  fvv = eval(vectorize(func2str(f)));
else
    fvv=vectorize(f);
end

yp=feval(fvv,tm,ym); 
s = 1./max(1/dt,abs(yp)./dy)*0.35;
h = ishold;
quiver(tval,yval,s,s.*yp,0,'r'); hold on;
quiver(tval,yval,-s,-s.*yp,0,'r');
if h
  hold on
else
  hold off
end
axis([tval(1)-dt/2,tval(end)+dt/2,yval(1)-dy/2,yval(end)+dy/2])

