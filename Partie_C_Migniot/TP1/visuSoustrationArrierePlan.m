function visuSoustrationArrierePlan(rep)
	% exemple visuSoustrationArrierePlan('sequence/action')	
	
	% format des frames de la séquence
	ext = '*.png';
	chemin = fullfile(rep,ext);
	list = dir(chemin);
	
	% calcul de l'image d'arrière-plan
	background=computeAverageBackground(rep);
	[h w]=size(background) ;
	BackSub=zeros(h,w);
	
	% cumul des différences vis à vis de l'arrière plan pour toutes les frames
	for n = 2:numel(list)
		Img=rgb2gray (imread(fullfile(rep, list(n).name))) ;
		BackSub=BackSub+double(abs(background-Img)) ;
	end
	
	% reclage sur une quantification classique
	M=max(max(BackSub));
	Res=uint8(255*BackSub/M);
		
	imshow(Res);

	
