function s = fast_wavelet_transform(signal, nbA) 
  signal
  signalLength = length(signal)
  if (rem (signalLength, 2) == 0)
    nivmax = fix(log2(signalLength))
    if (0 <= nbA && nbA <= nivmax)
      printf ("Starting Analysis:\n");
      
      hA=[1/2 ; 1/2 ; 0]; % filtres d’analyse
      gA=[-1/2 ; 1/2 ; 0];
      
      SW = signal;
      for niv=nivmax:-1:(nivmax-nbA+1)
        niv
        AN = SW(1:2^niv); % analyse du signal en entier, AN = [1 1 9 5 9 3 6 14]’
        %filtrage :
        C = conv(AN,hA,'same'); % [1 5 7 7 6 4.5 10 7]’
        D = conv(AN,gA,'same'); % [0 -4 2 -2 3 -1.5 -4 7]’
        % sous-echantillonnage par 2 :
        C = C(1:2:end); % [1 7 6 10]’
        D = D(1:2:end); % [0 2 3 -4]’
        AN = [C ; D]; % concaténation de C et D
        SW(1:2^niv) = AN;
      endfor
      s = SW;
    else
      printf ("Wrong Analysis Level\n");
    endif
  else
    printf ("Signal size is odd\n");
  endif
endfunction