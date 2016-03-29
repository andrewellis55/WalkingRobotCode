function [ r1Ax, r1Ay, r1Bx, r1By, r2Ax, r2Ay, r2Bx, r2By, r3Ax, r3Ay, r3Bx, r3By] = ThreeBarSolve( FrameAx, FrameAy,FrameBx, FrameBy, r1, r2, r3)
    %Calculates Angel
    IntAngle = acosd((r2^2 - r3^2 - r1^2)/(-2 * r1 * r3));


    %Creates Triangle Matrix
    A = [0, 0; r1, 0;r3 * cosd(IntAngle), r3 * sind(IntAngle)];
    
    %Finds Angel About Which to Rotate
    Rise = FrameBy - FrameAy;
    Run = FrameBx - FrameAx;
    RotationAngle = atan2d(Rise,-1* Run);
    
    %Creates Rotation Matrix
    R = [cosd(RotationAngle), -sind(RotationAngle); ...
        sind(RotationAngle), cosd(RotationAngle)];
    

    %Applies Linear Transformation
    A = A * R;
    
    %Translate to Adjoining Link
    A = A + [FrameBx, FrameBy; FrameBx, FrameBy;FrameBx, FrameBy];
    
    %Sets Output Values
    r1Ax = A(1,1);
    r1Ay = A(1,2);
    r2Ax = A(2,1);
    r2Ay = A(2,2);
    r3Ax = A(3,1);
    r3Ay = A(3,2);
    
    r1Bx = r2Ax;
    r1By = r2Ay;
    r2Bx = r3Ax;
    r2By = r3Ay;
    r3Bx = r1Ax;
    r3By = r1Ay;
    
end