function details = haar_analyse_prod_scal(signal) %signal = signal a analyser qui doit etre de longueur un multiple de 2 (vecteur colonne)
  
  long_signal = length(signal);
  nivmax = fix(log2(long_signal));  %nombre de niveaux d'echelle
  details = zeros(long_signal,1);   %pour stocker le resultat de l'analyse en ondelettes
  
  %nb_d = 1;
  for niv=1:1:nivmax
     n = 0;
     for k=(2^niv):(2^niv):long_signal
       d = 0;
       for i=1:long_signal
          d += signal(i) * haar_psi_analyse(niv, n, i-1);
       endfor
       details(2^(nivmax-niv)+1+n) = d;
       %nb_d = nb_d + 1;
       n = n + 1;
     endfor
  endfor

  %pour le dernier niveau d'echelle (nivmax+1) : cas particulier
  d = 0;
  for i=1:long_signal
      d += signal(i) * 2 * haar_psi_analyse(nivmax+1, 0, i-1);
  endfor
  details(1) = d;

  
endfunction