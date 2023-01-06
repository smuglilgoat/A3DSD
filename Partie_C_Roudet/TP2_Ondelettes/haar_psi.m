function y = haar_psi(t)
  if(t < 0 || t >= 1)
    y = 0;
  else 
    if (t < 1/2)
      y = 1;
    else 
      y = -1;
    endif
endif
  
endfunction
