function [LRratio,UDratio]=LRweight(pic)
  %The purpose of this function is to creat a ratio of black pixels
  %on the left half divided by the number of black pixels on the right half.
  %These L and R values will then be used to create a ratio L/R, wherein
  %the identity of a charactor may be further disected.
  %UDratio corresponds to Up Down ratio.
  %Note: if you take the sum of a 10x10 matrix, you get a 1x10 where the values of
  %each row are added into one row.
  dense1 = sum(pic,1);
  dense2_A = sum(pic,2);
  dense2 = transpose(dense2_A);
  dL1 = length(dense1)+0.01;
  dL2 = length(dense2)+0.01;
  dL_L1=floor(dL1/2);
  dL_R1=ceil(dL1/2);
  dL_L2=floor(dL2/2);
  dL_R2=ceil(dL2/2);
  SumR = 0;
  SumL = 0;
  SumU = 0;
  SumD = 0;
  
  for A=dL_R1:1:dL1
    AA = dense1(A);
    SumR=SumR+AA;
  endfor
  AA
  SumR
  
  for B=1:1:dL_L1
    BB = dense1(B);
    SumL=SumL+BB;
  endfor
  BB
  SumL
  
  for A=dL_R2:1:dL2
    AA = dense2(A);
    SumD=SumD+AA;
  endfor
  
  AA
  SumU
  
  for B=1:1:dL_L2
    BB = dense2(B);
    SumU=SumU+BB;
  endfor
  
  BB
  SumD
  
  LRratio=SumL/SumR;
  UDratio=SumU/SumD;
  

endfunction
