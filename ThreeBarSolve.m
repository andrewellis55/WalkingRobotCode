function [ r1Ax, r1Ay, r1Bx, r1By, r2Ax, r2Ay, r2Bx, r2By, r3Ax, r3Ay, r3Bx, r3By] = ThreeBarSolve( FrameAx, FrameAy,FrameBx, FrameBy r1, r2, r3, IntAngle)
   
    %Creates Triangle Matrix
    A = [FrameAx, FrameAy ; FrameAx + r2, FrameAy ;FrameAx + r3 * cosd(IntAngle), FrameAy + r3 * sind(IntAngle)];
    
    %Finds Angel About Which to Rotate
    Rise = FrameBy - FrameAy;
    Run = FrameBx - FrameAx;
    RotationAngle = atan2d(Rise/Run);
    
    %Creates Rotation Matrix
    R = [cosd(RotationAngle), -sind(RotationAngle); ...
        sind(RotationAngle), cosd(RotationAngle)];
    
    %Applies Linear Transformation
    A = A * R;
    
    %Sets Output Values
    
    
end