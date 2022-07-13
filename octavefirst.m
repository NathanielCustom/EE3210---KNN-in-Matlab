% EE 3210 - Project 05
% Nathaniel Hurley
% Noah Johnson
%
% Demonstration of Machine Learning in Matlab using k-Nearest Neighbors on
% MNIST handwritten digits dataset.
% http://yann.lecun.com/exdb/mnist/


%% Load Datasets %%
% Courtesy daniel-e: https://github.com/daniel-e/mnist_octave
% Comment out after already loaded to reduce computational time when
% iterating.
load('mnist.mat')

%% View Data Sample %%
% Formatting:
% Data - Each row is one image (28x28) worth of 784 pixels.
% Label - Each column is the label for the matching row.

% Note that the vector needs to be transposed to view correctly.
sampleImage = reshape(testX(1,:), 28, 28);
%imshow((sampleImage)')

%% Normalize Image Data %%
% Convert image data from (0,255) to (0,1)
testX_norm = (testX > 0);
trainX_norm = (trainX > 0);
%sampleImage = reshape(testX_norm(2,:), 28, 28);
%imshow((sampleImage)')

%% Reshape Image Data %%
% Reshape from multiple 1D (1x784) vectors to multiple 2D vectors (28x28)
% resulting in a 3D vector (28X28x10000).
testX_shaped = reshape(testX_norm(:,:)', 28, 28, []);
testX_shaped = permute(testX_shaped, [2, 1, 3]);
%imshow(testX_shaped(:,:,5001))

trainX_shaped = reshape(trainX_norm(:,:)', 28, 28, []);
trainX_shaped = permute(trainX_shaped, [2, 1, 3]);

%% Create Table of Features %%
features_train = trainY';

%% Extract Example Feature %%
% Total Pixels
pixelCount = sum(sum(trainX_shaped(:,:,:) == 1));
features_train(:,2) = reshape(pixelCount, size(trainX_shaped,3), 1);

% Transitions Count
[features_train(:,3), features_train(:,4)]  = countTransitions(trainX_shaped);
