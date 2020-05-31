% This function finds the distance between two 1x3 or 3x1 1D arrays.
% Author: Seong-June Her

function squaredDistance = SquaredDistance(P,Q)

% Find the difference between the 3 layers of the P and Q arrays.
squaredDistance = (P(1) - Q(1))^2 + (P(2) - Q(2))^2 + (P(3) - Q(3))^2;

end
