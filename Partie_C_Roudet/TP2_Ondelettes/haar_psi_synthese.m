function y = haar_psi_synthese(m, n, nbs)  %m : niveau d'echelle, n : translation, nbs : taille du signal (multiple de 2)
  y = zeros(1, nbs);
  for i=1:nbs
    y(i) = haar_psi(2^(-m) * (i-1) - n);
  endfor
  
  
endfunction