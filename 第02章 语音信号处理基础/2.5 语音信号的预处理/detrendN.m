function [y,xtrend] = detrendN(x, fs, m)
 % Remove linear and nonlinear trend
 % fs: Sample rate
 % m: Highest fitting order
 x = x(:); 
 N = length(x);
 t = (0:N-1)'/fs; % Solve time sequence
 a = polyfit(t, x, m); % Returns the coefficients for a polynomial x(t) of degree m
 xtrend = polyval(a, t); % Returns the value of a polynomial of coefficients a evaluated at t
 y = x - xtrend;
 end