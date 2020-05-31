% This function is used to assign points of a 3D image array with one of
% the specified k cluster values based upon the closest distance between
% the respective point and mean values.
% Author: Seong-June Her

function [clusters] = AssignToClusters(A,Means)

[k, ~, ~] = size(Means); % k is row size of Means
[rows, cols, ~] = size(A); % rows and cols are rows and columns size of A

% Red,Green,Blue colours for every coordinate of the selected image.
Red = A(:,:,1);
Green = A(:,:,2);
Blue = A(:,:,3);

% Preallocate for speed
Distance = zeros(1,k);
minimum = zeros(1,rows*cols);

for i = 1:rows*cols % Go through every pixel of the photo
    for j = 1:k
        M1=Means(j,1,1);
        M2=Means(j,1,2);
        M3=Means(j,1,3);
        % Finding squared distance between each point and means
        Distance(j) = (Red(i)-M1)^2 + (Green(i)-M2)^2 + (Blue(i)-M3)^2;
    end
    
    minimum(i) = min(Distance); % Finding the minimum distance
    
    for j = k:-1:1
        if minimum(i) == Distance(j)
            % Allocate the 'i' cluster value, 'clstr(i)', as 'j'
            clstr(i) = j;
        end
    end
end

% Reshape clusters as a rows by cols 2D array
clusters = reshape(clstr,[rows,cols]);
end








