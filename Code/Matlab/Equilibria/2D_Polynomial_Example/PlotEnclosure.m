function PlotEnclosure(x_bar, r)
  % Plot an enclosure for the solution x_bar
  % using the sup norm and the radius provided

  % Plot the point corresponding to the solution
  plot(x_bar(1), x_bar(2), '.', 'MarkerSize', 10, 'Color', 'k')

  hold on;

  % Compute the four corners of the square
  p1 = x_bar + r * [-1; -1];
  p2 = x_bar + r * [1; -1];
  p3 = x_bar + r * [1; 1];
  p4 = x_bar + r * [-1; 1];

  % Plot the sides of the square
  plot([p1(1) p2(1)], [p1(2) p2(2)], 'LineWidth', 2, 'Color', 'b');  % Line connecting p1 and p2
  plot([p2(1) p3(1)], [p2(2) p3(2)], 'LineWidth', 2, 'Color', 'b');  % Line connecting p2 and p3
  plot([p3(1) p4(1)], [p3(2) p4(2)], 'LineWidth', 2, 'Color', 'b');  % Line connecting p3 and p4
  plot([p4(1) p1(1)], [p4(2) p1(2)], 'LineWidth', 2, 'Color', 'b');  % Line connecting p4 and p1

  % Add axis labels
  xlabel('x', 'FontSize', 18)
  ylabel('y', 'FontSize', 18)
end
