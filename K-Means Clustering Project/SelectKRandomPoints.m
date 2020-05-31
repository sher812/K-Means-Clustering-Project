% This function selects a k number of random points from a 2D array of m
% rows and n columns. It returns a (k,2) 2D array representing the
% coordinates of the selected points.
% Author: Seong-June Her

function [points] = SelectKRandomPoints(A,k)
% allocate the array with m rows and n columns
[m, n, ~] = size(A);

% find non-repeating values out of all the positions in the array.
f = randperm(m*n);

% Preallocating for speed
row = zeros(k);
column = zeros(k);
points = zeros(k,2);

for i = 1:k
    point = f(i);
    % Using array calculations by columns, row(i) is found using this
    % equation
    row(i) = floor(point/n) + 1;
    % Column values will be the remainder.
    column(i) = mod(point,n);
    % Given that remainder is 0, column(i) value will be the n values long
    % and rows(i) length will be the result of the division.
    if column(i) == 0
        column(i) = n;
        row(i) = floor(point/n);
    end
    % Allocate "points" with the rows and columns values as a k x 2 array.
    points(i,1) = row(i);
    points(i,2) = column(i);
end
















