%Runs Initialization File
close all;
%Starts runtime timer
tic
%Initialises a number of variables
Initialization;


%Set Up Figure depending on dimention
if Dimentions == 3
    limits = [-150, 100, -150, 100, -150, 100];
else
    limits = [-150, 100, -150, 100];
end


%Sets initial max velocity for iteration
WalkerVelocityMax = 0;

%Initializes StepData aMAtrix
if ScaleSim == 1
    StepData(rev, 2) = 0;
end


%Simulation Loop
for r = 1:rev
    %initializes step radius for iteration
    stepRadius = 0;
    
    if ScaleSim == 1
        %Sets link lengths based on scale factor during scale simulation
        SF = r/ 50
        SetLinkLengths;
        WeightAssignment;
        
    end
    %Sets max torque for iteration
    MaxTorque = 0;
    %Sets link lengths
    SetLinkLengths;
    

    for i = 1:1:quality
        
        %Set T (theta) from loop iteration and multiply by angular velocity
        T = (i * 360 / quality) * W;
        mod(T, 360);
        
        %solves the two forward legs
        SolveLeg1;
        SolveLeg1_2;
        
        %Solves the two rear legs
        SolveLeg2;
        SolveLeg2_2;
        
        %Runs the torque simulation during a Scale Sim
        if ScaleSim == 1
        TorqueSim;
        end
        

        %Clear Figure
        clf;
        
        %Disables output during a scale sim
        Draw = 1;
        if ScaleSim ==1
            Draw = 0;
        end
        
        
        if Draw == 1
            %Draws in 3D
            if Dimentions == 3
                for legNum = Legs3D_1
                    for linkNum = 1:11
                        %DrawLink is a custom function
                        DrawLink3d_1(Leg(legNum).Link(linkNum).Pos(A).Cor(X).Rev(T),...
                            Leg(legNum).Link(linkNum).Pos(B).Cor(X).Rev(T),...
                            Leg(legNum).Link(linkNum).Pos(A).Cor(Y).Rev(T),...
                            Leg(legNum).Link(linkNum).Pos(B).Cor(Y).Rev(T))
                    end
                end
                for legNum = Legs3D_2
                    for linkNum = 1:11
                        DrawLink3d_2(Leg(legNum).Link(linkNum).Pos(A).Cor(X).Rev(T),...
                            Leg(legNum).Link(linkNum).Pos(B).Cor(X).Rev(T),...
                            Leg(legNum).Link(linkNum).Pos(A).Cor(Y).Rev(T),...
                            Leg(legNum).Link(linkNum).Pos(B).Cor(Y).Rev(T))
                    end
                end
                
            end
        end
       
        %Draws in 2D
        if Dimentions == 2
            for legNum = Legs2D
                for linkNum = 1:11
                    DrawLink(Leg(legNum).Link(linkNum).Pos(A).Cor(X).Rev(T),...
                        Leg(legNum).Link(linkNum).Pos(B).Cor(X).Rev(T),...
                        Leg(legNum).Link(linkNum).Pos(A).Cor(Y).Rev(T),...
                        Leg(legNum).Link(linkNum).Pos(B).Cor(Y).Rev(T))
                end
                
                if VelAnalysis ==1
                    
               DrawVelocity(1, C, 2, A, T);
                DrawVelocity(1, D, 2, B, T);
                DrawVelocity(1, E, 7, B, T);
                DrawVelocity(1, G, 4, B, T); 
                DrawVelocity(1, H, 11, A, T); 
                
                end
            end
        end
        
        
        
        
        %Set Axis
        axis(limits);
        grid on
        
        %Delay
        if Draw == 1
            pause(0.05)
        end
        
        
    end
    
    
    if ScaleSim == 1
        %Solves approxiamte Step length using Numerical integration
        StepLengthSolve
        %Solves approximate velocity
        WalkerVelocity = 3 * 0.0016667 * stepRadius / MaxTorque
        %If a new greatest velocity is found, it displays additional data
        if WalkerVelocity > WalkerVelocityMax
            WalkerVelocityMax = WalkerVelocity;
            MAX_torque = torque
            MAX_step = stepRadius
            MAX_Velocity = WalkerVelocityMax
            Max_SF = SF
        end
    end
    
end

%Displays runtime
toc


