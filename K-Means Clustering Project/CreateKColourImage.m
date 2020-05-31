% This function is used to create a image consisting of a selected k amount
% of colours. This output is created by the pixels being assigned to a k
% number of clusters. 
% Author: Seong-June Her

function MyImage = CreateKColourImage(clusters,means)

% Assign rows and columns 
[rows, cols] = size(clusters);

% Preallocate 3D image array for speed
MyImage = zeros(rows,cols,3);

% Assign a mean colour value based upon the cluster value assigned to each
% coordinate of the image array.
for i = 1:rows
    for j = 1:cols
        for k = 1:length(means)
            if clusters(i,j) == k
                MyImage(i,j,1) = means(k,1,1);
                MyImage(i,j,2) = means(k,1,2);
                MyImage(i,j,3) = means(k,1,3);
            end
        end
    end
end
% round the array so it can be converted into uint8
round(MyImage);
MyImage = uint8(MyImage);
end

