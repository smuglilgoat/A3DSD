function fr = seuillage_ondelettes_haar_prod_scal_nbcoefs(f,m)  %f doit etre un vecteur colonne ayant 2^k echantillons
                                                                %m = nombre de coefs a garder
  N = size(f,1);

  fw = haar_analyse_prod_scal(f);

  % select threshold
  v = sort(abs(fw(:)), 'descend');

  T = v(m);
  fwT = fw .* (abs(fw)>=T);
     
  fr = haar_synthese_prod_scal(f, fwT, log2(N)+1);

  % display
  figure
  subplot(3,1,1)
  plot_wavelet(fw); axis('tight');

  subplot(3,1,2)
  plot_wavelet(fwT); axis('tight');

  subplot(3,1,3)
  plot(fr); axis('tight');
  title(['T=' num2str(T)]);
endfunction
