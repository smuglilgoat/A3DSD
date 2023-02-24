function filtrage()
	Config = chargeConfiguration();
	Estimation = zeros(Config.nombre_de_frame,2) ;
	Particules = initialisation(Config);
	VT = chargeVeriteTerrain() ;
	
	for frame=1:Config.nombre_de_frame
		I=chargeImage(Config,frame);
        ParticulesAv=Particules;
        
		Particules = propagation(Particules,Config,Estimation,frame) ;
        visuPropagation(ParticulesAv,Particules,Config,I,frame) ;
        
		Particules = ponderation(Particules,Config,I) ;
		[Estimation(frame,1) Estimation(frame,2)]=visuParticules(Particules,Config,I,frame);
        %ParticulesPreResampling = Particules
		Particules = resampling(Particules,Config) ;
        %ParticulesPostResampling = Particules
	end


	critere = evaluation(Config,Estimation,VT)

