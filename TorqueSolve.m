for stepAngleItr = 1: quality
    stepAngle = stepAngleItr * 360 / quality;
 
    
    %Distance between the foot and the crankshaft
    Link11_CoodinateMatrix  = [Leg(1).Link(11).Pos(A).Cor(X).Rev(stepAngle) , ...
        Leg(1).Link(11).Pos(A).Cor(Y).Rev(stepAngle) ; ...
        Leg(1).Link(1).Pos(A).Cor(X).Rev(stepAngle) , ...
        Leg(1).Link(1).Pos(A).Cor(Y).Rev(stepAngle)];
    Link11_CoodinateMatrix = diff(Link11_CoodinateMatrix);
    DiffLength = abs(norm(Link11_CoodinateMatrix));
    %Calculates torque
    torque = WEIGHT / 2 * DiffLength /1000
   
    %Fills datafile
    TorqueData(stepAngle + (r-1) * quality, 1) = SF;
    TorqueData(stepAngle + (r-1) * quality, 2) = stepAngle;
    TorqueData(stepAngle + (r-1) * quality, 3) = torque;
   
end