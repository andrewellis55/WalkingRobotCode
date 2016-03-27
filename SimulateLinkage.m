%Runs Initialization File
WalkingRobot;

%Temp Variables
%A - Angle
%D - Distance

%Set Up Figure
figure
limits = [-250, 450, -250, 350];

%Number of Revolutions
rev = 10;

%Number of iterations per loop. 360 = max
quality = 90;

%Simulation Loop
for r = 1:rev
    for i = 1:(quality)
        
        %Set T (theta) from loop iteration
        T = i * 360 / quality;
     
        
        %1st Leg, Loop 1
        %Solve for ground Link
        groundBx = LegStartX(1) + FixedPointDist * cosd(191.5999);
        groundBy = LegStartY(1) + FixedPointDist * sind(191.5999);
        %Solving First FourBar Linkage
            [Leg(1).Link(1).Pos(A).Cor(X).Rev(T), ...
             Leg(1).Link(1).Pos(A).Cor(Y).Rev(T), ...
             Leg(1).Link(1).Pos(B).Cor(X).Rev(T), ...
             Leg(1).Link(1).Pos(B).Cor(Y).Rev(T),...
             Leg(1).Link(2).Pos(A).Cor(X).Rev(T),...
             Leg(1).Link(2).Pos(A).Cor(Y).Rev(T),...
             Leg(1).Link(2).Pos(B).Cor(X).Rev(T),...
             Leg(1).Link(2).Pos(B).Cor(Y).Rev(T),...
             Leg(1).Link(3).Pos(A).Cor(X).Rev(T),...
             Leg(1).Link(3).Pos(A).Cor(Y).Rev(T),...
             Leg(1).Link(3).Pos(B).Cor(X).Rev(T),...
             Leg(1).Link(3).Pos(B).Cor(Y).Rev(T)] = ...
             FourBarSolve( LegStartX(1),   LegStartY(1), ...
                           groundBx,       groundBy, ...
                           FixedPointDist, LinkLength(1), ...
                           LinkLength(2),  LinkLength(3), T, -1);
        
        

        %Plotting
        %Clear Figure
        clf;
        
        %DrawLinks
        for a = 1:3
            DrawLink(Leg(1).Link(a).Pos(A).Cor(X).Rev(T),...
                Leg(1).Link(a).Pos(B).Cor(X).Rev(T),...
                Leg(1).Link(a).Pos(A).Cor(Y).Rev(T),...
                Leg(1).Link(a).Pos(B).Cor(Y).Rev(T));
        end
        
        
        %Set Axis
        axis(limits);
        
        %Delay
        pause(.1)
        
        
    end
    
end




