function [r1Ax, r1Ay, r1Bx, r1By, r2Ax, r2Ay, r2Bx, r2By, r3Ax, r3Ay, r3Bx, r3By, r4Ax, r4Ay, r4Bx, r4By] = FourBarSolve( FrameAx, FrameAy, FrameBx, FrameBy, r1, r2, r3, r4, T2, FlipX, FlipY )
    %Solving r1
    r1Ax = FrameAx;
    r1Ay = FrameAy;
    r1Bx = FrameBx;
    r1By = FrameBy;
    
    %Solving r2
    %Solve Point A of Input Link (r2)
    r2Ax = FrameAx;
    r2Ay = FrameAy;
    %Solve for Point B of Input Link (r2)  
    %Solve for Point B of Input Link (r2)
    r2Bx = FrameAx + r2 * cosd(T2);
    r2By = FrameAy + r2 * sind(T2);

    %Point A
    r4Ax = FrameBx;
    r4Ay = FrameBy;
    %Solve  Diagonal from top of input to bottom out output
    D = sqrt(r2^2 + r1^2 - 2 * r2 * r1 * cosd(T2));
    %Solving for Beta (Interior Angle between r3 and r4)
    B = acosd((D^2 - r3^2 - r4^2) / (-2 * r3 * r4));
    %Solving for Gamma (Interior Angle between r1 and r4)
    C1 = asind((r2 * sind(T2)) / D);
    %C1 = acosd((r2^2 - D^2 - r1^2) / (-2 * r1 * D));
    C2 = acosd((r3^2 - D^2 - r4^2) / (-2 * r4 * D));
    GOffset = atand((FrameBy - FrameAy) / (FrameBx - FrameAx));
    %G = acosd((r3 + r4 - r1 - r2 + 2 * r1 * r2 * cosd(T2)) / (2 * r3 * r4)) + GOffset;
    G = 180 + GOffset - (C1 + C2);%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%168.4
    %Solving for Point B
    r4Bx = r4Ax + r4 * cosd(G);
    r4By = r4Ay + r4 * sind(G);
    
    
    %Solving r3B
    r3Bx = r4Bx;
    r3By = r4By;
      
    if (FlipY == 1)
        A = [FrameAx, r2Bx, r3Bx, r4Ax ;FrameAy, r2By, r3By, r4Ay];
        A = A';
        A = A * [-1, 0; 0, 1];
        transX = FrameBx - FrameAx;
        transY = FrameAy - FrameBy;
        A = A - [transX, transX, transX, transX;transY,transY,transY,transY]';
        r1Ax = A(1,1);
        r1Ay = A(1,2);
        r2Bx = A(2,1);
        r2By = A(2,2);
        r3Bx = A(3,1);
        r3By = A(3,2);
        r4Ax = A(4,1);
        r4Ay = A(4,2);
        
        r1Bx = r4Ax;
        r1By = r4Ay;
        r2Ax = r1Ax;
        r2Ay = r1Ay;
        r3Ax = r2Bx;
        r3Ay = r2By;
        r4Bx = r3Bx;
        r4By = r3By;
    end
    if (FlipX == 1)
        A = [FrameAx, r2Bx, r3Bx, r4Ax ;FrameAy, r2By, r3By, r4Ay];
        A = A';
        A = A * [1, 0; 0, -1];
        transX = FrameBx - FrameAx;
        transY = FrameAy - FrameBy;
       % A = A - [transX, transX, transX, transX;transY,transY,transY,transY]';
         r1Ax = A(1,1);
        r1Ay = A(1,2);
        r2Bx = A(2,1);
        r2By = A(2,2);
        r3Bx = A(3,1);
        r3By = A(3,2);
        r4Ax = A(4,1);
        r4Ay = A(4,2);
        
        r1Bx = r4Ax;
        r1By = r4Ay;
        r2Ax = r1Ax;
        r2Ay = r1Ay;
        r3Ax = r2Bx;
        r3Ay = r2By;
        r4Bx = r3Bx;
        r4By = r3By;
    end
 
       if 1==1
        Mat = [r3Ax, r3Ay ; r3Bx, r3By];
            Mat = diff(Mat);
            norm(Mat);
       end

        
end

