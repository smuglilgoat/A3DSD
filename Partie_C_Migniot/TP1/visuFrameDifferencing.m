function visuFrameDifferencing(rep)
	% exemple visuFrameDifferencing('sequence/action')		
		
	% format des frames de la séquence	
	ext = '*.png';
	chemin = fullfile(rep,ext);
	list = dir(chemin);

	% initialisation à partir de la première frame
	Ip = imread(fullfile(rep, list(1).name));
	Ip = rgb2gray (Ip);
	[h w]=size(Ip);
	FD=zeros(h,w,1);
	
	% cumul des différences en frames successives
	for n = 2:numel(list)
		In=rgb2gray (imread(fullfile(rep, list(n).name))) ;
		FD=FD+double(abs(In-Ip)) ;
		Ip=In;
	end
	
	% reclage sur une quantification classique
	M=max(max(FD));
	Res=uint8(255*FD/M);
	
	imshow(Res);
	
	

	

