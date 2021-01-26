function [x1, num_itr, converged] = Newton(f, Df, x0, max_itr, rel_tol, abs_tol)
% function [x1, num_itr, converged] = Newton(f, Df, x0, max_itr, rel_tol, abs_tol)
%
% Runs Newton method on the function f with initial guess x0
%
% Input:
% f = function that evaluates f
% Df = function to compute the Jacobian of f
% x0 = initial guess for Newton
% max_itr = Maximum number of Newton iterations
% rel_tol = Relative error tolerance for Newton
% abs_tol = Absolute error tolerance for Newton
%
% Output:
% x1 = solution that was computed if Newton converges
% num_itr = Number of iterations used be Newton
% converged = flag that is true if Newton converged

x1 = x0; % Initialize x1 as the initial guess x0

f_x1 = f(x1);         % Compute f at the initial point
norm_f1 = norm(f_x1); % Norm of f at the initial point

disp(' ')
disp('Newton iterations:')
disp(['||f(x)|| = ', num2str(norm_f1)])

converged = false; % Intialize converged to false
num_itr = 0;       % Intialize iteration counter

while (converged == false) && (num_itr < max_itr)
  x0 = x1;                   % Update x0
  Df_x1 = Df(x1);            % Jacobian matrix at x1
  u = mldivide(Df_x1, f_x1); % Newton iteration (solve linear sistem)
  x1 = x0 - u;               % Newton iteration (update x1)

  f_x1 = f(x1);          % Compute f(x1)
  norm_f1 = norm(f_x1);  % Norm of f(x1)
  norm_u = norm(u);      % Norm of u = x0 - x1
  norm_x0 = norm(x0);    % Norm of x0

  % Check if the method converged to a solution
  % Other stopping criteria that could be used:
  % norm_u <= max(rel_tol * norm_x0, abs_tol)
  % norm_u <= rel_tol * (norm_x0 + 1.0)
  % norm_u <= rel_tol * max(norm_x0, 1.0)
  % norm_f1 < rel_tol * norm_f0 + abs_tol % (Not so good, I think!)
  if (norm_u <= rel_tol * norm_x0 + abs_tol) || (norm_f1 == 0)
    converged = true;
  end

  disp(['||f(x)|| = ', num2str(norm_f1)])
  % disp(['||Df_inv(x)|| = ', num2str(norm(inv(Df(x1))))])

  num_itr = num_itr + 1; % Increment iteration counter
end

end
