% This function assigns points in a 3D image array into a k number of
% clusters for a given amount of iterations.
% Author: Seong-June Her

function [clusters,means] = KMeansRGB(A,seedMeans,maxIterations)

[k, ~, ~] = size(seedMeans); % k is row size of seedMeans

means = seedMeans; % Assign the means with the seedMeans value

% The previous mean, 'premean', will be equal to the mean value before the
% loop.
premean = means;

% Loop is run for number of maximum iterations.
for p = 1:maxIterations
    
    % Call the AssignToClusters function to assign clusters
    clusters = AssignToClusters(A,means);
    
    % Calculate the new mean using the UpdateMeans function
    NewMean = UpdateMeans(A,k,clusters);
    
    means = NewMean; % Assign new mean value
    
    if means == premean
        premean = seedMeans;
        break;       % Break the for loop if max iterations are reached
    else
        premean = NewMean; % Equate premean with mean before next loop
    end
end

if means == premean % premean == mean if convergence is reached
    disp('Maximum number of iterations reached before convergence was reached.');
end
end










