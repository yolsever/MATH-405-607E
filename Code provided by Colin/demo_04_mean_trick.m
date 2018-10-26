function y = demo_04_mean_trick(x)
% we are y = 2*x except for set of measure zero.
% But Adaptive Simpson will think we are y = 10.
%
% (a more practical example of this would be a sin/cos
% function which is zero at all the nodes.)

  set = [-1 -1/2 0 1/2 1];

  % Lie if we are close to the nodes.
  for j = 1:length(set)
    if abs(x - set(j)) < 1e-15
      y = 10;
      return
    end
  end

  % otherwise, tell the truth :)
  y = 2*x;
