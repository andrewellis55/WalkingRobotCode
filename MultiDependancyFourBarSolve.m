function [r1Ax, r1Ay, r1Bx, r1By, r2Ax, r2Ay, r2Bx, r2By, r3Ax, r3Ay, r3Bx, r3By, r4Ax, r4Ay, r4Bx, r4By] = MultiDependancyFourBarSolve( FrameAx, FrameAy, FrameBx, FrameBy, InputAx, InputAy, InputBx, InputBy, r1, r2, r3, r4)
    
     %Solves for Theta 2 via Dot Product
     a = InputBx - InputAx;
     b = InputBy - InputAy;
     c = FrameBx - FrameAx;
     d = FrameBy - FrameAy;
     T2 = acosd((a * c + b * d) / (r1 * r2));
     
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
    r4Ax = r1Ax + r1;
    r4Ay = r1Ay;
    %Solve  Diagonal from top of input to bottom out output
    D = sqrt(r2^2 + r1^2 - 2 * r2 * r1 * cosd(T2));
    %Solving for Beta (Interior Angle between r3 and r4)
    B = acosd((D^2 - r3^2 - r4^2) ./ (-2 * r3 * r4));
    %Solving for Gamma (Interior Angle between r1 and r4)
    C1 = asind(r2 * sind(T2) / D);
    C2 = acosd((r3^2 - D^2 - r4^2) ./ (-2 * r4 * D));
    G =180 -(C1 + C2);
    %Solving for Point B
    r4Bx = r4Ax + r4 * cosd(G);
    r4By = r4Ax + r4 * sind(G);
    
    
    %Solving r3B
    r3Bx = r4Bx;
    r3By = r4By;
    
    %Rotate
    if 1 == 1
        Rise = FrameBy - FrameAy;
        Run = FrameBx - FrameAx;
        RotationAngle = atan2d(Rise,-1* Run);
        
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
    
    


