function background=computeAverageBackground(rep)
	ext = '*.png';
	chemin = fullfile(rep,ext);
	list = dir(chemin);

	Img = imread(fullfile(rep, list(1).name));
	sumImage = double(rgb2gray (Img));

	
	for n = 2:numel(list)
		Img=imread(fullfile(rep, list(n).name)) ;
		Img = rgb2gray (Img);
		sumImage=sumImage+double(Img) ;
	end
	
	background=uint8(sumImage/numel(list));
	

