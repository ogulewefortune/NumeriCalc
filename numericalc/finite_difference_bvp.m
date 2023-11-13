function [x, y] = finite_difference_bvp(a, b, N, alpha, beta, f, method)
% Solves a boundary value problem using finite difference
% a: left endpoint
% b: right endpoint
% N: number of interior grid points
% alpha: boundary condition at a
% beta: boundary condition at b
% f: function handle for f(x) in the BVP y'' = f(x)
% method: method of finite difference ('central', 'backward', or 'forward')

% creates a vector x of n+2 evenly spaced grid points
x = linspace(a, b, N+2);
h = x(2) - x(1);% this line calculates the spacing between the adjacent grid points

% Define tridagonal matrix A using a finite difference method
if strcmp(method, 'central difference')
    A = diag(2/h^2 * ones(N, 1)) - diag(1/h^2 * ones(N-1, 1), 1) - diag(1/h^2 * ones(N-1, 1), -1); 
elseif strcmp(method, 'backward difference')
    A = diag(2/h^2 * ones(N, 1)) - diag(-2/h^2 * ones(N-1, 1), -1) - diag(1/h^2 * ones(N-2, 1), -2); 
elseif strcmp(method, 'forward difference')
    A = diag(2/h^2 * ones(N, 1)) - diag(-2/h^2 * ones(N-1, 1), 1) - diag(1/h^2 * ones(N-2, 1), 2); 
else
    error('Invalid method specified.');
end


% Add small perturbation to diagonal of A to make it non-singular
epsilon = 1e-10;
A = A + epsilon*eye(N);

% Apply boundary conditions to matrix A

A(1, 1) = -2/h^2;%these two enforce y(a) = alpha and alpha is the solution to the left endpoint
A(1, 2) = 2/h^2; %we multiply the first row of A by vector x we get (2/h^2 *x2)

A(N, N-1) = 2/h^2;%these two enforce the boundary conditions
A(N, N) = -2/h^2;%modify the last row of the matrix to eliminate the second to last variable in the last equation

% Define right-hand side vector
rhs = f(x(2:N+1))';% computes funtion f(x) at the interior points of the grid, result is a column vector of length N
rhs(1) = rhs(1) - alpha * (-2/h^2 + 2/h^2); %This line subtracts the boundary condition at x(1) from the first element of rhs.
rhs(end) = rhs(end) - beta * (2/h^2 - 2/h^2); %This line subtracts the boundary condition at x(N+2) from the last element of rhs.s

% Solve system of equations
y = A \ rhs; % system of equations Ay = rhs is solved using "\". The resulting vector y contains the numerical solution to the BVP at the interior grid points.

% Add boundary values to solution and plot
y = [alpha; y; beta]; %boundary values at x=a and x=b are added to the solution vector y to obtain the full numerical solution to the BVP
plot(x, y);
xlabel('x');
ylabel('y');
title(['Finite Difference Solution using ' method ' method']);

end
