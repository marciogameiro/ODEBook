function J = JacobianFiniteDifferences(f, x)

h = 1.0e-7;

m = size(f(x), 1);
n = size(x, 1);

J = zeros(m, n);
I = eye(n);

for j = 1:n
  x_h = x + h * I(:, j);
  J(:, j) = (f(x_h) - f(x)) / h;
end

end
