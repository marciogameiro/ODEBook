% Add path for numerics (Newton) code
addpath('../../Numerics')

% Set parameter value and system size
lambda = 5; N = 100;
% lambda = 50; N = 100;

% Define a function of x for fixed parameter
g = @(x) f(x, lambda);
Dg = @(x) Df(x, lambda);

% Initial guess for Newton
x0 = zeros(N + 1, 1);
x0(1) = 1.0; x0(2) = 0.5; x0(3) = 0.1;

% Compute the numerical solution using Newton's method
max_itr = 20;       % Maximum number of Newton iterations
% max_itr = 60;       % Maximum number of Newton iterations
rel_tol = 1.0e-14;  % Relative error tolerance for Newton
abs_tol = 1.0e-14;  % Absolute error tolerance for Newton

% Run Newton's method using x0 as initial guess to compute solution x_bar
[x_bar, ~, converged] = Newton(g, Dg, x0, max_itr, rel_tol, abs_tol);
% [x_bar, num_itr, converged] = Newton(g, Dg, x0, max_itr, rel_tol, abs_tol);

disp(' ')
disp(['The 1-norm of the computed solution is: ' num2str(norm(x_bar, 1))])
disp(' ')

% Verify the solution
[I, verified] = VerifySolution(g, Dg, x_bar, lambda);

% Existence interval
r_minus = I(1);
r_plus = I(2);

if verified == true
  disp('Verification successful!')
  disp(['The existence interval is I = (' num2str(r_minus, 16) ', ' num2str(r_plus, 16) ')'])
else
  disp('Verification failed!')
end
