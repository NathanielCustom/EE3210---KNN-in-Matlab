function [vert,cross] = sweep2 (pic)
    %vert will return the number of vertical transitions
    %cross will return the number of horazontal transitions
    %pic is the 2D matrix that will be the picture.
    %1's are presumed black pixel
    [y,x]=size(pic);
   
    heightr=round(y/4);
    widthr=round(x/8);
    
    
    %Horazontal Sweep:
    %cuts the picture horazontally into 4 pieces, resulting in 3 cuts.
    %%these cuts are 1, 2, and 3/4 of the picture.
    A=1; %sets which cut is being examined.
    B=1; %coordinate for matrix sweep
    crossx=0; %variable to count transitions
    for A:1:3
      for B=1:1:x
        SA=pic(heightr*A,1); %sets the variable to the first pixel value along the cut.
        SB=pic(heightr*A,B); %scans along the cut
        if SA != SB
          crossx=crossx+1;
          SA=SB;
        endif
      endfor
    endfor
    
    %Vertical Sweep:
    %The idea is, cut the picture into eights and examin 3, 4, and 5/8ths
    %%of the picture. This is because most items are well centered in the figure
    %%and there is much waisted realestate on the fringes.
    A=3;
    B=1;
    verty=0;
    for A:1:5
      for B=1:1:y
        SC=pic(1,widthr*A);
        SD=pic(B,widthr*A);
        if SC != SD
          verty = verty+1;
          SC=SD;
        endif
      endfor
    endfor
    
    cross = crossx/3;
    vert = verty/3;
    
    
endfunction

