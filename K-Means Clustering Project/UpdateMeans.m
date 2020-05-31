% This function produces a single (k,1,3) 3D array output of mean values
% for the colours of each cluster.
% Author: Seong-June Her

function means = UpdateMeans(A,k,clusters)

% Red,Green,Blue colours for every coordinate of the selected image array
Red = A(:,:,1);
Green = A(:,:,2);
Blue = A(:,:,3);

% Preallocating for speed
means = zeros(k,1,3);
TotalRED = zeros(1,k);
TotalGREEN = zeros(1,k);
TotalBLUE = zeros(1,k);

% Assigning total sum value of Red,Green,and Blue values for 1 to k
% number of clusters.
for i = 1:k
    a = clusters==i;
    TotalRED(i) = sum(Red(a));
    TotalGREEN(i) = sum(Green(a));
    TotalBLUE(i) = sum(Blue(a));
end

% Assigning each layer of the means with the Red,Green and Blue mean values
for j = 1:k
    b = clusters==j;
    means(j,:,1) = TotalRED(j)/length(Red(b));
    means(j,:,2) = TotalGREEN(j)/length(Green(b));
    means(j,:,3) = TotalBLUE(j)/length(Blue(b));
end
end




