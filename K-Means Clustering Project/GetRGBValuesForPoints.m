% This function extracts the RGB colour values from the coordinates
% of a specified 2D array.
% Author: Seong-June Her

function seedMeans = GetRGBValuesForPoints(A, points)

[m, ~, ~] = size(points); % Allocate 'm' as the number of rows of points
seedMeans = zeros(m,1,3); % Preallocation for speed

if sum(size(points))>3 % If there are 2 or more rows of points
    for i = 1:m
        % allocate the red,green,blue values to the seedMeans layers 1, 2,
        % 3 respectively
        seedMeans(i,:,1) = (A(points(i),points(i+m),1))';
        seedMeans(i,:,2) = (A(points(i),points(i+m),2))';
        seedMeans(i,:,3) = (A(points(i),points(i+m),3))';
    end
else
    % If there is only 1 row of points
    seedMeans(1,:,1) = (A(points(1),points(2),1))';
    seedMeans(1,:,2) = (A(points(1),points(2),2))';
    seedMeans(1,:,3) = (A(points(1),points(2),3))';
end

