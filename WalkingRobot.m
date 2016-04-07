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
LegStartX(2) = -38;
LegStartY(2) = -7.8;

SetLinkLengths;

WEIGHT = 1;

%Constants********************
X=1; Y=2;A=1;B=2; Norm = 0; FlipY = 1; FlipX = 1;


%Initialize Linkage Array*****
Leg(4).Link(11).Pos(2).Cor(2).Rev(3600)=0;
Leg(4).Link(11).Weight = 0;
Leg(4).Link(11).Length = 0;




