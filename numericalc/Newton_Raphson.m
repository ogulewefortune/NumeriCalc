function [root, ea, iteration] = Newton_Raphson(f, df, x0, es, maxiter)
% Input:
%   f = function
%   df = derivative of function
%   x0 = initial guess
%   es = stopping criterion (if not entered, will default to 0.0001%)
%   maxiter = maximum number of iterations (if not entered, will default to 50)
% Outputs:
%   root = real root
%   ea = approximate relative error as percentage
%   iteration = number of iterations

if nargin < 4 || isempty(es), es = 0.0001; end
if nargin < 5 || isempty(maxiter), maxiter = 50; end

iter = 0;
xr = x0;

while (1)
    xr_old = xr;
    xr = xr - f(xr)/df(xr);
    iter = iter + 1;
    
    if xr ~= 0
        ea = abs((xr - xr_old)/xr) * 100;
    end
    
    if ea <= es || iter >= maxiter
        break
    end
end

root = xr;
iteration = iter;

end 
