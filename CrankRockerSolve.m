function [r1Ax, r1Ay, r1Bx, r1By, r2Ax, r2Ay, r2Bx, r2By, r3Ax, r3Ay, r3Bx, r3By, r4Ax, r4Ay, r4Bx, r4By] = CrankRockerSolve( FrameAx, FrameAy, FrameBx, FrameBy, r1, r2, r3, r4, T2)
T2
    %Solving r1
    r1Ax = 0;
    r1Ay = 0;
    
    %Solving r2
    %Solve for Point B of Input Link (r2) Relative to Origin
    r2Bx = r1Ax + r2 * cosd(T2);
    r2By = r1Ay + r2 * sind(T2);
    
    %Solving r3A
    %Solving for Point A of Coupler (r3)
    r3Ax = r2Bx;
    r3Ay = r2By;
    
    %Solving r4
    %Point A
    r4Ax = r1Ax - r1;
    r4Ay = r1Ay;
    
    %T3 Solver
    if 0 <= T2 && T2 < 90
    %Solve  Diagonal from top of input to bottom out output
    D = CosLaw(r1, r1, T2)
    %Solve for Angle Between r2 ad D
    C1 = RevCosLaw(D, r2, r1);
    %Solve for Angle Between D and r3
    C2 = RevCosLaw(D, r3, r4);
    %Solves for Total Interior Angle
    C = C1 + C2;
    %Solves for T3
    T3 = 180 + T2 - C
    elseif 90  <= T2 && T2 < 360
    %Solve  Diagonal from top of input to bottom out output
    D = CosLaw(r1, r1, T2);
    %Solve for Angle Between r2 ad D
    C1 = RevCosLaw(D, r2, r1);
    %Solve for Angle Between D and r3
    C2 = RevCosLaw(D, r3, r4);
    %Solves for Total Interior Angle
    C = C1 + C2;
    %Solves for T3
    T3 = 360 - T2 - C
    elseif 180 <= T2 && T2 < 270
    %Solve  Diagonal from top of input to bottom out output
    D = abs( CosLaw(r1, r1, T2) );
    %Solve for Angle Between r2 ad D
    C1 = RevCosLaw(D, r2, r1);
    %Solve for Angle Between D and r3
    C2 = RevCosLaw(D, r3, r4);
    %Solves for Total Interior Angle
    C = C2 - C1;
    %Solves for T3
    T3 = -180 + T2 + C
    elseif 270 <= T2 && T2 <= 360
    %Solve  Diagonal from top of input to bottom out output
    D = abs( CosLaw(r1, r1, T2) );
    %Solve for Angle Between r2 ad D
    C1 = RevCosLaw(D, r2, r1);
    %Solve for Angle Between D and r3
    C2 = RevCosLaw(D, r3, r4);
    %Solves for Total Interior Angle
    C = C2 - C1;
    %Solves for T3
    T3 = -180 + T2 - C
    end

    %Solve for r3 Point B
    r3Bx = r3Ax + r3 * cosd(T3);
    r3By = r3Ay + r3 * sind(T3);
    
    r4Bx = r3Bx;
    r4By = r3By;
    
    
    %Rotate
    if 1 == 2
        Rise = FrameBy - FrameAy;
        Run = FrameBx - FrameAx;
        RotationAngle = atan2d(Rise, -1 * Run);
        
        A = [r1Ax, r2Bx, r3Bx, r4Ax ;r1Ay, r2By, r3By, r4Ay]';
        
        R = [cosd(RotationAngle), -sind(RotationAngle); ...
        sind(RotationAngle), cosd(RotationAngle)];
        A = A * R;
        
        transX = FrameBx;
        transY = FrameBy;
        A = A + [transX, transX, transX, transX;transY,transY,transY,transY]';
        r1Ax = A(1,1);
        r1Ay = A(1,2);
        r2Bx = A(2,1);
        r2By = A(2,2);
        r3Bx = A(3,1);
        r3By = A(3,2);
        r4Ax = A(4,1);
        r4Ay = A(4,2);
    end 
        r1Bx = r4Ax;
        r1By = r4Ay;
        r2Ax = r1Ax;
        r2Ay = r1Ay;
        r3Ax = r2Bx;
        r3Ay = r2By;
        r4Bx = r3Bx;
        r4By = r3By;
    
        
        if 1==2
        Mat = [r4Ax, r4Ay ; r4Bx, r4By];
            Mat = diff(Mat);
            norm(Mat)
        end
end

function [c] = CosLaw(a, b, Theta)
    c = sqrt(a^2 + b^2 - 2 * a * b * cosd(Theta));
end

function [Theta] = RevCosLaw (a, b, c)
    Theta = acosd((c^2 - a^2 - b^2) / (-2 * a * b));
end

function [ThetaA] = SinLaw(A, B, SinB)
    ThetaA = asind(A * sind(SinB) / B);
end 

function [A] = RevSinLaw(B, SinA, SinB)
    A = B * sind(SinA) / sind(SinB);
end 

