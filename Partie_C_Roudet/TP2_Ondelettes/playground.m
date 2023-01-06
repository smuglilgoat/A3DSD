S1 = [1 ; 1 ; 9 ; 5 ; 9 ; 3 ; 6 ; 14];

[a, s] = fast_wavelet_transform_synth(S1, 3, 3)

figure
plot_wavelet(a, 2);

figure
plot_wavelet(s, 0);

T = 3; % définition du seuil : essayer plusieurs valeurs
SWT = s .* (abs(s)>=T); % formule pour le seuillage de l’amplitude des coefs
figure
plot_wavelet(SWT, 0);