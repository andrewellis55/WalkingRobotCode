%Runs Initialization File
close all;
tic
WalkingRobot;

%STATISTICAL SIM%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
StatSim = 0;

%3D/2D
Dimentions = 2;

%Set Up Figure
%figure
if Dimentions == 3
    limits = [-150, 100, -150, 100, -150, 100];
else
    limits = [-150, 100, -150, 100];
end

%Number of Revolutions
rev = 100;

WalkerVelocityMax = 0;

%Initializes StepData aMAtrix
if StatSim == 100
    StepData(rev, 2) = 0;
end
%Number of iterations per loop. 360 = max
quality = 60;

%Simulation Loop
for r = 1:rev
    stepRadius = 0;
    if StatSim == 1
        SF = r/ 50
        SetLinkLengths;
        WeightAssignment;
        
    end
    MaxTorque = 0;
    SetLinkLengths;
    %WeightAssignment;
    for i = 1:1:quality
        
        %Set T (theta) from loop iteration
        T = (i * 360 / quality);
        mod(T, 360);
        
        SolveLeg1;
        SolveLeg1_2;
        
        SolveLeg2;
        SolveLeg2_2;
        
        
        %TorqueSim;
        
        
        %Plotting
        %Clear Figure
        clf;
        
        %DrawLinks
        Draw = 1;
        if StatSim ==1
            Draw = 0;
        end
        
        
        if Draw == 1
            if Dimentions == 3
                for legNum = [1 2]
                    for linkNum = 1:11
                        DrawLink3d_1(Leg(legNum).Link(linkNum).Pos(A).Cor(X).Rev(T),...
                            Leg(legNum).Link(linkNum).Pos(B).Cor(X).Rev(T),...
                            Leg(legNum).Link(linkNum).Pos(A).Cor(Y).Rev(T),...
                            Leg(legNum).Link(linkNum).Pos(B).Cor(Y).Rev(T))
                    end
                end
                for legNum = [3 4]
                    for linkNum = 1:11
                        DrawLink3d_2(Leg(legNum).Link(linkNum).Pos(A).Cor(X).Rev(T),...
                            Leg(legNum).Link(linkNum).Pos(B).Cor(X).Rev(T),...
                            Leg(legNum).Link(linkNum).Pos(A).Cor(Y).Rev(T),...
                            Leg(legNum).Link(linkNum).Pos(B).Cor(Y).Rev(T))
                    end
                end
                
            end
        end
        
        if Dimentions == 2
            for legNum = [1 2 3 4]
                for linkNum = 1:11
                    DrawLink(Leg(legNum).Link(linkNum).Pos(A).Cor(X).Rev(T),...
                        Leg(legNum).Link(linkNum).Pos(B).Cor(X).Rev(T),...
                        Leg(legNum).Link(linkNum).Pos(A).Cor(Y).Rev(T),...
                        Leg(legNum).Link(linkNum).Pos(B).Cor(Y).Rev(T))
                end
            end
        end
        
        
        %Set Axis
        axis(limits);
        grid on
        
        %Delay
        if Draw == 1
            pause(.05)
        end
        
        
    end
    
    
    if StatSim == 1
        StepLengthSolve
        WalkerVelocity = 3 * 0.0016667 * stepRadius / MaxTorque;
        if WalkerVelocity > WalkerVelocityMax
            WalkerVelocityMax = WalkerVelocity;
            MAX_torque = torque
            MAX_step = stepRadius
            MAX_Velocity = WalkerVelocityMax
            Max_SF = SF
        end
    end
    
end

toc


