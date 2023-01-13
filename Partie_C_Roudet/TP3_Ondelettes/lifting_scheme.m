function [a, d] = fast_wavelet_transform(signal) 
  signal
  signalLength = length(signal)
  nivmax = fix(log2(signalLength))
  
  d = [];
  a = [];
  A = [];
  D = [];
  
  printf ("Starting Analysis:\n");
  SW = signal;
  for niv=nivmax:-1:1
    niv
  
    for i = 0:length(SW)/2 - 1
      i
      d = [d; SW(2 * i + 2) - SW(2 * i + 1)];
      a = [a; SW(2 * i + 1) + d(i + 1) / 2];
    endfor

    d
    a

    A = [A; a];
    D = [D; d];

    SW = a;

    d = [];
    a = [];
  endfor
  a = A;
  d = D;
endfunction