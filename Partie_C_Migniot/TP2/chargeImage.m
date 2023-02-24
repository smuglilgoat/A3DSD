function I=chargeImage(Config,frame)
	nom=char(strcat('sequence/',Config.nom_sequence,num2str(frame),'.png'));
	I=imread(nom) ;
