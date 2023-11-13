function [coefficients, y_interpolation] = newton_polynomials(x_data, y_data, x_interpolation)
% Function that computes the coefficients of the Newton polynomial
% interpolation and evaluates the interpolated function at given points.

% Inputs:
% - x_data: vector of x-values of the data points
% - y_data: vector of y-values of the data points
% - x_interpolation: vector of x-values at which to evaluate the interpolated function

% Outputs:
% - coefficients: vector of coefficients of the Newton polynomial
% - y_interpolation: vector of interpolated y-values corresponding to x_interpolation

% Compute the divided differences
n = length(x_data);
div_diff = zeros(n,n);
div_diff(:,1) = y_data(:);

for j = 2:n
    for i = j:n
        div_diff(i,j) = (div_diff(i,j-1) - div_diff(i-1,j-1))/(x_data(i) - x_data(i-j+1));
    end
end

% Compute the coefficients of the Newton polynomial
coefficients = div_diff(1,:);

% Evaluate the interpolated function at given points
m = length(x_interpolation);
y_interpolation = zeros(1,m);

for k = 1:m
    x = x_interpolation(k);
    y_interpolation(k) = coefficients(n);
    
    for j = n-1:-1:1
        y_interpolation(k) = coefficients(j) + (x - x_data(j))*y_interpolation(k);
    end
end
