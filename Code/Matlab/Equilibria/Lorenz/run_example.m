
% Add path for numerics (Newton) code
addpath('../../Numerics') 

% Define the parameter values for Lorenz
sigma = 10; rho = 28; beta = 8/3;

% Define a function of x for fixed parameters
g = @(x) f(x, sigma, rho, beta);
Dg = @(x) Df(x, sigma, rho, beta);
% Dg = @(x) JacobianFiniteDifferences(g, x);

% Initial guess for Newton
x0 = [8; 8; 25];

% Compute the solution
x_bar = ComputeSolution(g, Dg, x0);
% x_bar = [8.4853; 8.4853; 27];
% x_bar = [8.4; 8.4; 26.5];
% x_bar = [sqrt(beta * (rho - 1)); sqrt(beta * (rho - 1)); rho - 1];

disp(' ')
disp('The computed solution is:')
disp(['x_bar = (' num2str(x_bar(1), 16) ', ' num2str(x_bar(2), 16) ', ' num2str(x_bar(3), 16) ')'])
disp(' ')

% Verify the solution
[I, verified] = VerifySolution(g, Dg, x_bar);

% Existence interval
r_minus = I(1);
r_plus = I(2);

if verified == true
  disp('Verification successful!')
  disp(['The existence interval is I = (' num2str(r_minus, 16) ', ' num2str(r_plus, 16) ')'])
else
  disp('Verification failed!')
end
