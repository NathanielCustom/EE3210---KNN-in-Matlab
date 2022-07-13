function [h_tx,v_tx] = countTransitions(images)
    %vert will return the number of vertical transitions
    %cross will return the number of horazontal transitions
    %pic is the 2D matrix that will be the picture.
    %1's are presumed black pixel
    

    
    % Testing Images
    %images(:,:,1) = [1 0 0 1 0 0 0 1 0 0 0 1; ...
    %          0 0 0 1 0 0 0 1 0 0 0 1; ...
    %          1 1 1 0 1 1 1 0 1 1 1 0; ...
    %          0 0 0 1 0 0 0 1 0 0 0 1; ...
    %          0 0 0 1 0 0 0 1 0 0 0 1; ...
    %          0 0 0 1 0 0 0 1 0 0 0 1;]
    % images(:,:,2) = [1 0 0 1 0 0 0 1 0 0 0 1; ...
    %          0 0 0 1 0 0 0 1 0 0 0 1; ...
    %          1 1 1 0 1 1 1 0 1 1 1 0; ...
    %          0 0 0 1 0 0 0 1 0 0 0 1; ...
    %          0 0 0 1 0 0 0 1 0 0 0 1; ...
    %          0 0 0 1 0 0 0 1 0 0 0 1;]
              
    % Initialize Vectors
    v_tx = zeros(size(images,3),1);
    h_tx = zeros(size(images,3),1);
    
    %Horizontal Sweep:
    %cuts the picture horazontally into 4 pieces, resulting in 3 cuts.
    %%these cuts are 1, 2, and 3/4 of the picture.
    lastPixel = 0;
    for imgInd = 1:size(images,3)
      for i = [0.25, 0.5, 0.75]
        differenceVector = diff(images(floor(size(images,1)*i),:,imgInd));
        transitionCount = sum(differenceVector == 1) + sum(differenceVector == -1);
        h_tx(imgInd,1) = h_tx(imgInd,1) + transitionCount;
      end
    end


    %%% TODO: See if you can create a sweep for the vertical now.
    
    %Vertical Sweep:
    %The idea is, cut the picture into eights and examin 3, 4, and 5/8ths
    %%of the picture. This is because most items are well centered in the figure
    %%and there is much waisted realestate on the fringes.  
    
endfunction

