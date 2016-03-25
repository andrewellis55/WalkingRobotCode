%Runs Initialization File
WalkingRobot;

%Set Up Fiure
figure
limits = [-250, 450, -250, 350];


%Number of Revolutions
rev = 2;

%Number of iterations per loop. 360 = max
quality = 30

%Simulation Loop
for r = 1:rev
    for i = 1:(quality)
        
        %Set T (theta) from loop position
        T = i * 360 / quality
     
        
        %1st Leg, Link 1
        Leg(1).Link(1).Pos(A).Cor(X).Rev(T) = LegStartX(1);
        Leg(1).Link(1).Pos(A).Cor(Y).Rev(T) = LegStartY(1);
        Leg(1).Link(1).Pos(B).Cor(X).Rev(T) = Leg(1).Link(1).Pos(A).Cor(X).Rev(T) + LinkLength(1)*cosd(T);
        Leg(1).Link(1).Pos(B).Cor(Y).Rev(T) = Leg(1).Link(1).Pos(A).Cor(Y).Rev(T) + LinkLength(1)*sind(T);
        
        %Plotting
        clf;
        
        %Define Links;
        Link1x = [Leg(1).Link(1).Pos(A).Cor(X).Rev(T), Leg(1).Link(1).Pos(B).Cor(X).Rev(T)];
        Link1y = [Leg(1).Link(1).Pos(A).Cor(Y).Rev(T), Leg(1).Link(1).Pos(B).Cor(Y).Rev(T)];
        
        %Draw Links
        line(Link1x, Link1y, 'Marker', 'o');
        
        %Set Axis
        axis(limits);
        
        pause(.01)
        
        
    end
    
end




