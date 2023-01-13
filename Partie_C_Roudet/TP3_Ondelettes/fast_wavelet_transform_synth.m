function [a, s] = fast_wavelet_transform_synth(signal, nbA, nbS) 
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
        analisysLevel = abs(nivmax-niv+1)
        AN = SW(1:2^niv); % analyse du signal en entier, AN = [1 1 9 5 9 3 6 14]’
        %filtrage :
        C = conv(AN,hA,'same'); % [1 5 7 7 6 4.5 10 7]’
        D = conv(AN,gA,'same'); % [0 -4 2 -2 3 -1.5 -4 7]’
        % sous-echantillonnage par 2 :
        C = C(1:2:end); % [1 7 6 10]’
        D = D(1:2:end); % [0 2 3 -4]’
        AN = [C ; D]; % concaténation de C et D
        SW(1:2^niv) = AN
      endfor
      a = SW
      if (0 <= nbS && nbS <= nbA)
        printf ("Starting Synthesis:\n");
        
        hS=[0 ; 1 ; 1]; % filtre passe bas de synthèse
        gS=[0 ; 1 ; -1]; % filtre passe haut de synthèse
        
        for niv=(nivmax-nbA+1):1:nbS
          niv
          C = SW(1:2^(niv - 1));
          D = SW(1 + 2^(niv - 1):2^(niv - 1) + 2^(niv - 1));
          
          C1 = zeros(2*size(C,1), size(C,2), size(C,3));
          C1(1:2:end) = C;
          D1 = zeros(2*size(D,1), size(D,2), size(D,3)); 
          D1(1:2:end) = D; 
          
          R1 = conv(C1, hS, 'same'); 
          R2 = conv(D1, gS, 'same'); 
          
          SY = R1 + R2;
          SW(1:2^niv) = SY
        endfor
        s = SW;
      else
        printf ("Wrong Synthesis Level\n");
      endif
    else
      printf ("Wrong Analysis Level\n");
    endif
  else
    printf ("Signal size is odd\n");
  endif
endfunction