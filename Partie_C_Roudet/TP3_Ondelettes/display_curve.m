function courbe = display_curve(name) %une courbe est vue comme un nombre complexe
courbe = [];
if(isequal(name,'simple'))   % courbe tres simple avec un nb de points puissance de 2
    courbe = [0 0.1 0.5 1 1.3 1.8 2 0]' + 1i * [0 0.5 0.5 1 0.4 0.7 0 0]';  
    figure
    plot(courbe, 'r.--'); 
else
    fid=fopen(name);    % herisson, hippocampe ou virus = nom du fichier
    if(fid ~= -1)
      tline = fgetl(fid);
      V = textscan(tline, '%f %f');
      i = 1;
      while ~feof(fid)
               tline = fgetl(fid);
               i = i+1;
               V(i,:) = textscan(tline,'%f %f');   % V : vecteur colonne stockant les coordonnées des points
      end
      n = size(V,1);
      init = zeros(n,1);
      courbe = complex(init,0);
      for i=1:n
              courbe(i) = complex(V{i,1}, V{i,2}); 
      end
      figure
      plot(courbe, 'r.--'); 
    end
end


