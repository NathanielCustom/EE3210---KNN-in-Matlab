function [LRratio,UDratio]=LRweight(images)
  %The purpose of this function is to creat a ratio of black pixels
  %on the left half divided by the number of black pixels on the right half.
  %These L and R values will then be used to create a ratio L/R, wherein
  %the identity of a charactor may be further disected.
  %UDratio corresponds to Up Down ratio.
  %Note: if you take the sum of a 10x10 matrix, you get a 1x10 where the values of
  %each row are added into one row.

  % Testing Images
  %  images(:,:,1) = [1 0 0 1 0 0 0 1 0 0 0 1; ...
  %            0 0 0 1 0 0 0 1 0 0 0 1; ...
  %            1 1 1 0 1 1 1 0 1 1 1 0; ...
  %            0 0 0 1 0 0 0 1 0 0 0 1; ...
  %            0 0 0 1 0 0 0 1 0 0 0 1; ...
  %            0 0 0 1 0 0 0 1 0 0 0 1;]
  %   images(:,:,2) = [1 0 0 1 0 0 0 1 0 0 0 1; ...
  %            0 0 0 1 0 0 0 1 0 0 0 1; ...
  %            1 1 1 0 1 1 1 0 1 1 1 0; ...
  %            0 0 0 1 0 0 0 1 0 0 0 1; ...
  %            0 0 0 1 0 0 0 1 0 0 0 1; ...
  %            0 0 0 1 0 0 0 1 0 0 0 1;]

  % Initialize Vectors
  LRratio = zeros(size(images,3),1);
  UDratio = zeros(size(images,3),1);

  %% Left-Right Ratio
  pixelCountLeft  = sum( sum( images(:, 1:floor(size(images,2)/2), ...
                                     :) == 1));
  pixelCountRight = sum( sum( images(:, floor(size(images,2))/2:size(images,2), ...
                                     :) == 1));
  LRratio = reshape(pixelCountLeft./pixelCountRight, size(images,3), 1);


  %%% TODO: See if you can create a ratio between top and bottom now.
  %% Up-Down Ratio



end
