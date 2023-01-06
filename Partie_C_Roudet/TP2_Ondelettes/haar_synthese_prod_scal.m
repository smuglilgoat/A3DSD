function rec = haar_synthese_prod_scal(signal, details, niveau)  %signal = signal a analyser qui doit etre de longueur un multiple de 2 (vecteur colonne)
  %details = vecteur colonne des details analyses, niveau = nb de niveaux d'echelle a la synthese qui doit etre <= log2(long_signal) + 1
  
  long_signal = length(signal);
  nivmax = fix(log2(long_signal));  %nombre de niveaux d'echelle
  rec = zeros(long_signal,1);   %pour stocker le resultat de l'analyse en ondelettes
  
  %niv 1 de synthese :
  for i=1:long_signal
      rec(i) = details(1);
  endfor
  
  if(niveau > 1)
 
    for niv=nivmax:-1:(nivmax-niveau+2)
       n = 0;
       for k=(2^niv):(2^niv):long_signal;
         det = details(n + 2^(nivmax-niv+1) - 2^(nivmax-niv) +1);
         y = haar_psi_synthese(niv, n, long_signal);
         rec = rec + (det .* y');
         
         n = n + 1;
       endfor
    endfor
  endif
  
endfunction