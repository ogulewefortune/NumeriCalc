function [x, fx, n] = bisection_method(f, a, b, tol, max_iter)
% BISECTION_METHOD finds a root of a function using the bisection method.
% 
%   [x, fx, n] = BISECTION_METHOD(f, a, b, tol, max_iter) returns the 
%   approximate root x of the function f in the interval [a, b], the value
%   of the function at x (fx), and the number of iterations required (n) 
%   to achieve a tolerance of tol or to reach the maximum number of 
%   iterations allowed (max_iter).
%
%   f is a function handle representing the function to find a root of.
%   a and b are the endpoints of the initial interval.
%   tol is the tolerance for the approximate root.
%   max_iter is the maximum number of iterations allowed.
%
%   Example usage:
%       f = @(x) x^2 - 2;
%       [x, fx, n] = bisection_method(f, 1, 2, 1e-6, 100);
%       disp(['Approximate root: ', num2str(x)]);
%       disp(['Function value at root: ', num2str(fx)]);
%       disp(['Iterations required: ', num2str(n)]);
%
%   Written by [Your Name], [Date]

% Check input arguments
if nargin < 5
    max_iter = 1000;
end
if nargin < 4
    tol = 1e-6;
end

% Initialize variables
n = 0;
fa = f(a);
fb = f(b);

% Check that the interval contains a root
if fa * fb > 0
    error('The function has the same sign at both endpoints of the interval. No root can be found.')
end

% Main loop
while n < max_iter
    n = n + 1;
    
    % Bisect the interval
    c = (a + b) / 2;
    fc = f(c);
    
    % Check convergence
    if abs(fc) < tol
        x = c;
        fx = fc;
        return
    end
    
    % Update the interval
    if fa * fc < 0
        b = c;
        fb = fc;
    else
        a = c;
        fa = fc;
    end
end

% If we get here, we have exceeded the maximum number of iterations
warning('Maximum number of iterations reached without convergence.')
x = c;
fx = fc;
end
