function visuMHI(rep,seuil)
	% exemple visuMHI('sequence/action',30)	
	
	% format des frames de la séquence
	ext = '*.png';
	chemin = fullfile(rep,ext);
	list = dir(chemin);

	% initialisation à partir de la première frame
	Img1 = rgb2gray (imread(fullfile(rep, list(1).name)));
	[h w]=size(Img1);
	MHI=zeros(h,w);
    MHIPrev=zeros(h,w);
	
	tau=numel(list); % la variable tau est donnée par le nombre de frames
	
	% ballayage de l'ensemble des frames
	for n = 2:numel(list)
		Img=rgb2gray (imread(fullfile(rep, list(n).name))) ;	%n ième image de la séquence
		ImgPrev=rgb2gray (imread(fullfile(rep, list(n-1).name))) ;
        B = abs(Img - ImgPrev) > seuil;

        for i = 1:h
            for j = 1:w
                if B(i,j) == 1
                    MHI(i,j) = tau;
                elseif MHIPrev(i, j) ~= 0
                    MHI(i, j) = MHIPrev(i , j) - 1;
                else
                    MHI(i,j) = 0;
                end
            end
        end
		
		MHIPrev = MHI;	
    end


	m=max(max(MHI));
	imshow(uint8(255*MHI/m));
	

	

