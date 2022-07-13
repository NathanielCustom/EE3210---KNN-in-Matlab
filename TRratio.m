function [Yrat,Xrat] = TRratio (pic)
  %The purpose of this function is simular to sweep2.m, but instead of taking
  %the average of the three transitions and returning a number, this function
  %will take the top portion's number of transitions and divide it by the bottom
  %portion's number of transitions.
  %There is a problem with this code! for some reasone SB is being set to the first
  %value that it encounters. But its value is not being updated to reflect a new value
  %that SA could be. SA is subject to change, while SB is set. If SA doesn't equal
  %SB, then SB should equal SA and a tic should be added to the count. Or so I
  % I thought this was my logic.
  % Note to future: can be fixed by adding if SB==1, SB=0 in first if statement.
  
  [y,x]=size(pic);
  readx = round(x/4);
  ready = round(y/4);
  
  Ucount1=0;
  Dcount1=0;
  
  Rcount1=0;
  Lcount1=0;
  
  %Horazontal
  
  for A=1:1:x
    SA=pic(readx,A);
    SB=pic(readx,1);
    if SA!=SB
      Ucount1=Ucount1+1;
      SB=SA;
    endif
  endfor
  Ucount1
  
  for A=1:1:x
    SA=pic(3*readx,A);
    SB=pic(3*readx,1);
    if SA!=SB
      Dcount1=Dcount1+1;
      SB=SA;
    endif
  endfor
  Yrat=Ucount1/Dcount1;
  Dcount1
  
  %Vertical
  
  for A=1:1:y
    SA=pic(A,ready);
    SB=pic(1,ready);
    if SA!=SB
      Lcount1=Lcount1+1;
      SB=SA;
    endif
  endfor
  
  for A=1:1:y
    SA=pic(A,3*ready);
    SB=pic(1,3*ready);
    if SA!=SB
      Rcount1=Rcount1+1;
      SB=SA;
    endif
  endfor
  Xrat=Lcount1/Rcount1;
  %This can be made more accurate my adding a few more sweep points. instead of sweeping at
  %1/4ths and 3/4ths on both the x and y oreintation, try adding plus/minus to the sweep lines.
  % This will make the area of each sweep larger and improve the data that is grabbed.
  %For the x oreintation, try catching the outer edges. For the Y oreintation, try making the search bands
  %closer. The added data can then be added together and an avg can be used instead.

endfunction
