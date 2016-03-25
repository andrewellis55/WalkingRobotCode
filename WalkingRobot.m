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
LinkLength(1) = 15;
LinkLength(2) = 50;
LinkLength(3) = 41.5;
LinkLength(4) = 55.8;
LinkLength(5) = 40.1;
LinkLength(6) = 39.3;
LinkLength(7) = 39.4;
LinkLength(8) = 36.7;
LinkLength(9) = 61.9;
LinkLength(10) = 65.7;
LinkLength(11) = 49;


%Constants********************
X=1; Y=2;A=1;B=2;


%Initialize Linkage Array*****
Leg(4).Link(11).Pos(2).Cor(2).Rev(361)=0;





