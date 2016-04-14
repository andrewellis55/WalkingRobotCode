%This is The Master control file for the Walking Robot. 
%Please Select the desired options in this file and run it. It will call
%all subsequent required files

%Simulation Type%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 1 = on, 0 = off

%ScaleSIM------
%This simulation optimizes the scale of the model based on required torque
%at various weights, step lengths and power ov the motor. There are no
%visualizations during the scale Sim. Output will be displayed in the 
%command window displaying the scale and velocity.
%Additional data will be displayed when a new maximum
%velocity is reached throughout the iteration. Due to placeholder values
%being used for the power if the motor, the velocity is treated as a unitless 
%value and only the relative magnitude of the numbers should be considered
ScaleSim = 0;

%Torque Analysis-------
%This is build into the Scale simulation
%Required torques at each stage of the simulation can be outputted to the
%user by running the 'TorqueSolve.m' file

%Velocity Anylysis---------
%This Analysis displays the velocity vectors for one leg. This only
%functions in 2D. This function does contain some slight timming
%innacuracies due to how the dirrivatives were parsed through matlab. The
%vectors are correct althought they are not all displayed in sync with the
%simulation. This problem was not solved due to time restrictions. The
%velocity vectors are only displayed for 1 leg 
VelAnalysis = 0;

%3D/2D----------
%Select Which Dimention to run the Sim 2 or 3
%Note: Must be 2D if velocity analysis is selected
Dimentions = 2;



%Simulation Settings%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Number of Legs-------------
%Must be set individually for 2D/3D. Velovity analysis is for Leg 1, so
%make sure that Leg 1 is displayed while running that.
%2D------
%Input leg numbers to simulate into matrix
%Default:
% Legs2D = [1 2 3 4];
Legs2D = [1 2 3 4];
%3D-------
%Default:
% Legs3D_1 = [1 2];
% Legs3D_2 = [3 4];
Legs3D_1 = [1 2];
Legs3D_2 = [3 4];


%Set Number of Revolutions--------
%Press Ctrl - C during the simultion to end the sim before all revolutions
%have elaplsed
rev = 1;

%Set Quality--------
%The Quality is the number of iterations per loop. A higher quality is
%recomended when running torque or scale simualtions as numerical
%integrations are preformed. High qualities will cause the simulation to
%slow. Recomended values are between 30 to 260.
quality = 30;


%Sets Scale Factor--------
%The scale simulation iterates this value to find the optimal scale for
%the design. During regualar simulation this value may be set. The
%recomended value for visualizaztion is 1
%1 unit =  1 mm
SF = 1; 


%Set Angular Velocity of Input
%Angular velocity must be set as a global variable as it must be seen by
%various sub-functions
global W
W = 1;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Begins Code
SimulateLinkage;





