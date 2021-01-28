% Add path for numerics (Newton) code
addpath('../../Numerics')

% Define the parameter values for Lorenz
sigma = 10; rho = 28; beta = 8/3;

% Define a function of x for fixed parameters
g = @(x) f(x, sigma, rho, beta);
Dg = @(x) Df(x, sigma, rho, beta);

% Initial guess for Newton
x0 = [8; 8; 25];

% Compute the solution
x_bar = ComputeSolution(g, Dg, x0);

disp(' ')
disp('The computed solution is:')
disp(['x_bar = (' num2str(x_bar(1), 16) ', ' num2str(x_bar(2), 16) ', ' num2str(x_bar(3), 16) ')'])
disp(' ')

% Redefine the parameter values as intervals
sigma = intval(10);
rho = intval(28);
beta = intval(8)/intval(3);

% Define interval versions a f and Df
g = @(x) f(x, sigma, rho, beta);
Dg = @(x) Df(x, sigma, rho, beta);

% Define interval version of x_bar
x_bar = intval(x_bar);

% Verify the solution using interval arithmetic
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
