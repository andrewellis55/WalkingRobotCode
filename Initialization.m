%Initialisation Filve for Various Variables

%Leg Crank Corrdinates********
LegStartX(1) = 0;
LegStartY(1) = 0;
LegStartX(2) = -38;
LegStartY(2) = -7.8;

SetLinkLengths;

%Specific Gravity of material. 1 is used for simualtion purposes
WEIGHT = 1;

%Constants********************
X=1; Y=2; Norm = 0; FlipY = 1; FlipX = 1;
A=1;B=2;C=3;D=4;E=5;F=6;G=7;H=8;

%Initialize Linkage Array*****
global Leg
Leg(4).Link(11).Pos(2).Cor(2).Rev(3600)=0;
Leg(4).Link(11).Weight = 0;
Leg(4).Link(11).Length = 0;
Leg(4).Joint(8).Vx.Rev(3600)=0;
Leg(4).Joint(8).Vy.Rev(3600)=0;
Leg(4).Joint(8).W.Rev(3600)=0;
Leg(4).Joint(8).Kinematics.Rev(3600)=0;





