S1 = [1 ; 1 ; 9 ; 5 ; 9 ; 3 ; 6 ; 14]; % vecteur colonne de taille 8 = 23

% analyse sur un niveau :
hA=[1/2 ; 1/2 ; 0]; %vecteur colonne
gA=[-1/2 ; 1/2 ; 0]; %vecteur colonne
% filtrage :
C = conv(S1, hA, 'same'); % [1 5 7 7 6 4.5 10 7]’ : application du filtre passe-bas
D = conv(S1, gA, 'same'); % [0 -4 2 -2 3 -1.5 -4 7]’ : application du filtre passe-haut
% sous-echantillonnage par 2 :
C = C(1:2:end); % [1 7 6 10]’ : sous-éch. par 2 pour obtenir les coefficients d’échelle
D = D(1:2:end); % [0 2 3 -4]’ : sous-éch. par 2 pour obtenir les coefficients d’ondelettes
AN = [C ; D]; % concatenation de C et D : [1 7 6 10 0 2 3 -4]’
% affichage des coefficients d’échelle et d’ondelette au niveau 1 avec la fonction plot_wavelet (dans TP1_ondelettes.zip sur Plubel)
plot_wavelet(AN, 2); % 2 = 3 – 1 (3 étant le maximum possible de niveaux d’analyse du signal,
% 1 signifie qu’on réalise l’analyse au 1er niveau)

% synthèse sur un niveau :
% sur-echantillonnage par 2 = ajout de zéros entre chaque échantillon de C et D :
C1 = zeros(2*size(C,1), size(C,2), size(C,3)); % C1 = [0 0 0 0 0 0 0 0]’
C1(1:2:end) = C; % C1 = [1 0 7 0 6 0 10 0]’
D1 = zeros(2*size(D,1), size(D,2), size(D,3)); % D1 = [0 0 0 0 0 0 0 0]’
D1(1:2:end) = D; % D1 = [0 0 2 0 3 0 -4 0]’
hS=[0 ; 1 ; 1]; % filtre passe bas de synthèse
gS=[0 ; 1 ; -1]; % filtre passe haut de synthèse
% filtrage :
R1 = conv(C1, hS, 'same'); % [1 1 7 7 6 6 10 10]’
R2 = conv(D1, gS, 'same'); % [0 0 2 -2 3 -3 -4 4]’
SY = R1 + R2; % somme : [1 1 9 5 9 3 6 14]’ = S1 : signal reconstruit parfaitement

S1 = [1 ; 1 ; 9 ; 5 ; 9 ; 3 ; 6 ; 14];
n = length(S1); % n = 8
nivmax = fix(log2(n)); % nivmax = 3
hA=[1/2 ; 1/2 ; 0]; % filtres d’analyse
gA=[-1/2 ; 1/2 ; 0];
SW = S1; % pour stocker le résultat de l'analyse en ondelettes
% analyse au 1er niveau :
AN = SW(1:2^3); % analyse du signal en entier, AN = [1 1 9 5 9 3 6 14]’
%filtrage :
C = conv(AN,hA,'same'); % [1 5 7 7 6 4.5 10 7]’
D = conv(AN,gA,'same'); % [0 -4 2 -2 3 -1.5 -4 7]’
% sous-echantillonnage par 2 :
C = C(1:2:end); % [1 7 6 10]’
D = D(1:2:end); % [0 2 3 -4]’
AN = [C ; D]; % concaténation de C et D
SW(1:2^3) = AN; % stocker dans le vecteur résultant SW le résultat de la concaténation de C et D
% SW = [1 7 6 10 | 0 2 3 -4]’
% analyse au 2nd niveau :
AN = SW(1:2^2); % analyse de l’approximation grossière du signal (seuls les 4 coefs d’échelle)
% AN = [1 7 6 10]’
%filtrage :
C = conv(AN,hA,'same'); % [4 6.5 8 5]’
D = conv(AN,gA,'same'); % [-3 0.5 -2 5]’
% sous-echantillonnage par 2 :
C = C(1:2:end); % [4 8]’
D = D(1:2:end); % [-3 -2]’
AN = [C ; D]; % concaténation de C et D : AN = [4 8 -3 -2]’
SW(1:2^2) = AN; % remplacer dans SW les 4 coefs d’échelle par le résultat de la concaténation
% SW = [4 8 | -3 -2 | 0 2 3 -4]’
% analyse au dernier niveau :
AN = SW(1:2^1); % analyse de l’approximation grossière du signal (seuls les 2 coefs d’échelle)
% AN = [4 8]’
%filtrage :
C = conv(AN,hA,'same'); % [6 4]’
D = conv(AN,gA,'same'); % [-2 4]’
% sous-echantillonnage par 2 :
C = C(1:2:end); % [6]’
D = D(1:2:end); % [-2]’
AN = [C ; D]; % concaténation de C et D : AN = [6 -2]’
SW(1:2^1) = AN; % remplacer dans SW les 2 coefs d’échelle par le résultat de la concaténation
% SW = [6 | -2 | -3 -2 | 0 2 3 -4]'
plot_wavelet(SW, 0); % 0 = 3 – 3 : affichage en considérant les 3 niveau