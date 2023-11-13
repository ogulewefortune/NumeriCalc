function I = gaussLegendre(a, b, n, f)
% Computes the definite integral of f(x) over [a,b] using the Gauss-Legendre
% formula with n points.
%
% Inputs:
%   a, b: limits of integration
%   n: number of points to use in the Gauss-Legendre formula (2 or 3)
%   f: function handle for the integrand
%
% Outputs:
%   I: approximation to the integral of f(x) over [a,b]

if n ~= 2 && n ~= 3
    error('Number of points for Gauss-Legendre formula must be 2 or 3');
end

switch n
    case 2
        x = [-sqrt(1/3); sqrt(1/3)];  % two-point Gauss-Legendre rule
        w = [1; 1];
    case 3
        x = [-sqrt(3/5); 0; sqrt(3/5)];  % three-point Gauss-Legendre rule
        w = [5/9; 8/9; 5/9];
end

% Rescale the integration interval to [-1,1]
t = (b-a)/2;
c = (a+b)/2;

% Evaluate the integrand at the Gauss-Legendre points where x is the array
% of Gauss-Legendre points using t and c to scale and shift them.
% This produces an array of function values y that are weighted by the Gauss-Legendre weights w.
y = f(t*x + c);

% Compute the approximation to the integral where the dot product of w and y is computed using element-wise multiplication (.*)
% and then summed using the sum function. 
% The final result is multiplied by t to account for the rescaling of the integration interval.
I = t*sum(w.*y);
end
