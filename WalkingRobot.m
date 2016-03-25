%Main Class


%Inputs***********************
GearRatio = 1;
%Scale Factor : 1 unit =  1 mm
SF = 1; 
%AngularVelocity
w = 2 * pi; 


%Leg Crank Corrdinates********
LegStartX(1) = 0;
LegStartY(1) = 0;


%Link Lengths*****************
LinkLength(1) = 15 * SF;
LinkLength(2) = 50 * SF;
LinkLength(3) = 41.5 * SF;
LinkLength(4) = 55.8 * SF;
LinkLength(5) = 40.1 * SF;
LinkLength(6) = 39.3 * SF;
LinkLength(7) = 39.4 * SF;
LinkLength(8) = 36.7 * SF;
LinkLength(9) = 61.9 * SF;
LinkLength(10) = 65.7 * SF;
LinkLength(11) = 49 * SF;


%Constants********************
X=1; Y=2;A=1;B=2;


%Initialize Linkage Array*****
Leg(4).Link(11).Pos(2).Cor(2).Rev(361)=0;





