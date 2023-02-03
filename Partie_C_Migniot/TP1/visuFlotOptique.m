function visuFlotOptique(frame1,frame2)
	I1=imread(frame1);
	I1 = rgb2gray (I1);
	I2=imread(frame2);
	I2 = rgb2gray (I2);

	addpath('OpticalFlow-master')
	winSize = 21;
	[ux, uy, l1, l2] = LucasKanade(I1,I2, winSize);
	vecSpacing = 5;
	eigCutOff = 0.3e-6;
	vecScale = 7;

	pts = CalcValidPoints(l1, l2, vecSpacing, eigCutOff);
	close;
	PlotFlow(I1,I2, ux, uy, pts, vecScale);


% ex frame1=rgb2gray(imread('sequence/action/seq2_001.png'));
% 	 frame2=rgb2gray(imread('sequence/action/seq2_002.png'));	
%	 visuFlotOptique(frame1,frame2)
