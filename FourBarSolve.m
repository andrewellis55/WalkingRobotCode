function [ r2Ax, r2Ay, r2Bx, r2By, r3Ax, r3Ay, r3Bx, r3By r4Ax, r4Ay, r4Bx, r4By] = FourBarSolve( FixAx, FixAy, FixBx, FixBy, r1, r2, r3, r4, T2, flip  )
    %Solving r2
    %Solve Point A of Input Link (r2)
    r2Ax = FixAx;
    r2Ay = FixAy;
    %Solve for Point B of Input Link (r2)
    r2Bx = FixAx + r2 * sind(T2);
    r2By = FixAy + r2 * cosd(T2);
    
    %Solving r3
    %Solving for Point A of Coupler (r3)
    r3Ax = r2Bx;
    r3Ay = r2By;
    %Solving for point B of Coupler (r3)
    %Solve  Diagonal from top of input to bottom out output
    D = sqrt(r2^2 + r1^2 - 2 * r2 * r1 * cosd(T2));
    %Solving for Beta (Interior Angle between r3 and r4)
    B = acosd((D^2 - r3^2 - r4^2) / (-2 * r3 * r4));
    %Solving for Gamma
    G = asind(r1 * sind(T2) / D) + asind(r4 * sind(B) / D);
    %Solving for Theta 3 (Angle between r2 and r3)
    if flip == 1
    T3 = -180 + T2 + G;
    elseif flip == -1
        T3 = 180+T2 - G;
    end 
    %Solving for Point B
    r3Bx = r3Ax + r3 * cosd(T3);
    r3By = r3Ay + r3 * sind(T3);
    
    %Solving r4
    r4Ax = r3Bx;
    r4Ay = r3By;
    r4Bx = FixBx;
    r4By = FixBy;
    
end
