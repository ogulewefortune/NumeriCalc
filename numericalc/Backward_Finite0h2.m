function b2 = Backward_Finite0h2(func, h, x)
% 3 points required

% Program receives a function, an h value for step size, and an x value
%   Input: 
%   func = function
%   h = step size
%   x = x value
%   Formula for calculation: f'(x) = 3*f(x(i)) = 4(fx(i-1)) + f(x(i-2)) / h


% substitute each entered value into the function below to calculate the 
% final answer 

b2 = (3 *(func(x)) - 4*(func(x-h)) + func(x - (2*h)))/(2*h);

end