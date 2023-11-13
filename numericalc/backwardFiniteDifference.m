function dfdx = backwardFiniteDifference(f, x, h)
%   dfdx = backwardFiniteDifference(f, x, h) computes the first derivative of
%   the function f(x) at the point x using the backward finite difference
%   method with a step size of h. The output argument dfdx is the approximation
%   of f'(x).
%
%   Example usage:
%       f = @(x) x^2 + 2*x;
%       x = 1;
%       h = 0.1;
%       dfdx = backwardFiniteDifference1(f, x, h)

    dfdx = (f(x) - f(x - h)) / h;

end
