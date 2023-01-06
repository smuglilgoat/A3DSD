   
N = 512;  name = 'piece-regular';
f = load_signal(name,N);  
f = f-min(f);            % pour que le signal n’ait que des valeurs positives
clf; subplot(2,1,1); plot(f); axis('tight'); title('Signal');

fw = haar_analyse_prod_scal(f);
subplot(2,1,2); plot_wavelet(fw,0); axis('tight'); title('Wavelets');
figure
rec = haar_synthese_prod_scal(f, fw, 10);
plot(rec);                 % le signal est bien reconstruit ! 

% seuillage en precisant un seuil T :
fr = seuillage_ondelettes_haar_prod_scal(f,0);    % reconstruction parfaite
fr = seuillage_ondelettes_haar_prod_scal(f,2);    % à vous de faire varier le seuil T (ici il vaut 2)

% seuillage en precisant le nb de coefs d’ondelettes a conserver :
fr = seuillage_ondelettes_haar_prod_scal_nbcoefs(f,100);      % ne conserver que 100 coefs 
									% parmi les 512