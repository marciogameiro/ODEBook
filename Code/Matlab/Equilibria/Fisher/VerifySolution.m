function [I, verified] = VerifySolution(f, Df, x_bar, lambda)
  % This function uses the radii polynomials approach to verify
  % rigorously that there is solution to f(x)=0, near the
  % approximate solution x_bar provided.
  %
  % The function returns verified = true if the method is
  % successful in verifying rigorously the existence of a solution.
  % In this case it returns the interval I of radii for which the
  % radii polynomials are negative. If the rigorous verificatin
  % fails the function returns verified = false and I = [-1, -1].

  % Compute A, the numerical inverse of Df
  A = inv(Df(x_bar));

  % Compute the Y0 bound using the 1-norm
  Y0 = norm(A * f(x_bar), 1);

  % Compute the Z0 bound using the 1-norm
  Z0 = norm(eye(size(A)) - A * Df(x_bar), 1);

  % Compute the Z2 bound using the 1-norm
  Z2 = 2 * abs(lambda) * norm(A, 1);

  % Define the radii polynomial
  p = [Z2, -(1 - Z0), Y0];

  % Compute and sort the roots
  r = sort(roots(p));

  % Need to decrease the interval by a small value delta_r
  delta_r = 1e-15;

  % Compute the interval I
  I = [r(1) + delta_r, r(2) - delta_r];

  % Make sure the endpoints of I are positive real numbers
  if (imag(I(1)) ~= 0) || (imag(I(2)) ~= 0) || (I(1) <= 0) || (I(2) <=0)
    I = [-1, -1];
    verified = false;
    return
  end

  %% Now we need to check if the radii polynomials are negative on I

  % Evaluate the raddi polynomials at the endpoints
  r1 = I(1); r2 = I(2);
  p1 = Z2 * r1^2 -(1 - Z0) * r1 + Y0;
  p2 = Z2 * r2^2 -(1 - Z0) * r2 + Y0;

  % If p1 and p2 are negative
  if (p1 < 0) && (p2 < 0)
    verified = true;
  else % Verification failed, set I = [-1, -1]
    I = [-1, -1];
    verified = false;
  end
end
