%% Generate CDFs and AUCs for THG hyperintensities
% Nicole Chernavsky 2024
%% Threshold 
% The script will read each file in a folder.
% Create a binary mask of all the clusters by global threshold that is given by user.
% Compute the shape measurment (area) of each cluster in a frame.
% The areas of each cluster is stored as a cumulative distribution function (CDF) for each file.
%% Steps
% 1) Each RGB frame is converted to gray scale --> it is unit8
% 2) Generate a binary mask to segment clusters. 
% 3) Compute the Area of each cluster and generate a CDF.
% 4) Calculate the integral of CDF between user-chosen cluster sizes.
% 5) Repeat for all frames.
%% How to Use
% Input
%   -- Give the percent threshold of interest
%   -- Change the pixel areas of interest, if desired
% Output 
%   -- CDF of each cluster and area-under-curve of CDFs for each file.
%% Acknowledgement
% Modified from: Sajid Ali, Sungkyunkwan University, Suwon, South Korea
% Date: |May 31, 2022|
% Contact: sajidali@skku.edu
%% 
function [vq1, auc] = hyperAUC(percent)

% select folder
pname = [uigetdir '/'];
files = dir([pname '*.tif']);
num_frames = length(files);

% initialize variable to merge all timepoints into one 3-D array
video = zeros(512,512,num_frames);
for j = 1:num_frames
    % read tiff files and add into 3-D array
    video(:,:,j) = tiffreadVolume([pname files(j).name]);
end

measurements = cell(1,num_frames);
x = 1:1:50; % pixel areas of interest for interpolation and AUC

vq1 = zeros(num_frames, length(x));
auc = zeros(1,num_frames);

%calculate AUC at % threshold
numVals = floor(512*512*percent/100);
for i = 1:num_frames
    % Convert to the gray image
    grayImage = video(:,:,i);

    % Creates a binary image from 2-D grayscale image by replacing all values above 
    % threshold with 1 and setting all other values to 0
   grayVec = reshape(grayImage,[512*512,1]);
   roi = sort(grayVec,'descend'); 
   T = roi(numVals);
   mask = imbinarize(grayImage, T);

   %acquires areas of each pixel group
    measurements{i} = regionprops('table', mask, grayImage, 'Area');

    %cdf of pixel areas
    figure(1);
    h1 = cdfplot(measurements{i}.Area);
    h1newX = h1.XData(3:2:end-1);
    h1newY = h1.YData(3:2:end-1);
    %figure(1);hold on;plot(h1newX,h1newY);
    
    %auc of cdf
    vq1(i,:) = interp1(h1newX,h1newY,x);
    auc(i) = trapz(x,vq1(i,:));
end

figure; plot(x,vq1(1,:));
for i = 2:num_frames
hold on;plot(x,vq1(i,:));
end
hold off;

end