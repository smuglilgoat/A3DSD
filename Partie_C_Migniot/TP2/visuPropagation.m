function visuPropagation(ParticulesAv,ParticulesAp,Config,I,frame)

	hold on;
	for k=1:Config.nombre_de_particule
		plot([ParticulesAv(k,2) ParticulesAp(k,2)],[ParticulesAv(k,1) ParticulesAp(k,1)],'Color','r','LineWidth',1)
	end
	hold off;
	
