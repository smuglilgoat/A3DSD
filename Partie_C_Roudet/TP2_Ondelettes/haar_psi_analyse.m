function y = haar_psi_analyse(m, n, t)  %m : niveau d'echelle, n : translation
  y = 2^(-m) * haar_psi(2^(-m) * t - n);
  
endfunction