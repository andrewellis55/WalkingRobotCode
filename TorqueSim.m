%TorqueSim
modAngle = mod(T, 360);

%Legs 1 and 4 in contact
if 70 <= modAngle && modAngle < 280
   %Calculated Leg vertical distance from the motor cranks shaft foir each leg 
   Leg1Dist = abs(Leg(1).Link(1).Pos(A).Cor(Y).Rev(T) - Leg(1).Link(11).Pos(A).Cor(Y).Rev(T));
   Leg4Dist = abs(Leg(4).Link(1).Pos(A).Cor(Y).Rev(T) - Leg(4).Link(11).Pos(A).Cor(Y).Rev(T));

   %Calculates torque
   torque = (NetForce / 2 * Leg1Dist /1000) + (NetForce / 2 * Leg4Dist /1000);
else
    %Legs 2 and 3 in contact
    %Calculated Leg vertical distance from the motor cranks shaft foir each leg 
   Leg2Dist = abs(Leg(2).Link(1).Pos(A).Cor(Y).Rev(T) - Leg(2).Link(11).Pos(A).Cor(Y).Rev(T));
   Leg3Dist = abs(Leg(3).Link(1).Pos(A).Cor(Y).Rev(T) - Leg(3).Link(11).Pos(A).Cor(Y).Rev(T));

   %Calculates torque
   torque = (NetForce / 2 * Leg2Dist /1000) + (NetForce / 2 * Leg3Dist /1000);
end

% If the torqur is greater than the previous max torque, the current torque
% value becomes the new max
if torque > MaxTorque
    MaxTorque = torque;
end


