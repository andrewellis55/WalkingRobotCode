function [Vx2, Vy2, Vx3, Vy3] = CrankRockerVelocity( FrameAx, FrameAy, FrameBx, FrameBy, r1, r2, r3, r4, Angle, FlipX, FlipY,W, Offset)
 
    %This function is basically the same as CrankRockerSolve, but replaces
    %T2 with a symbolic variable to allow matlab to differentiate the
    %functions. This content was originally in the same file as Crank
    %Rocker Solve but was duplicated here due to the processign time matlab
    %required to work work with symbolic variables.




    %Checks if an offset has been provided as an input argument
    if exist('Offset', 'var') ~= 0
        Angle = Angle + Offset;
    end
    
    %Defaults W to 1 if not set
     if exist('Offset', 'var') ~= 0
        W = 1;
    end

    
    if FlipX == 1
        Angle = Angle * -1;
    end
    
    Angle =Angle * pi / 180;
    
    %Declares T2 as a symbolic variable
    syms T2;

    
    %Solving r1
    r1Ax = 0;
    r1Ay = 0;
    r2Ax = 0;
    r2Ay = 0;
    
    %Solving r2
    %Solve for Point B of Input Link (r2) Relative to Origin
    r2Bx = r2Ax + r2 * cos(T2);
    r2By = r2Ay + r2 * sin(T2);
    
    %Solving r3A
    %Solving for Point A of Coupler (r3)
    r3Ax = r2Bx;
    r3Ay = r2By;
    
    %Solving r4
    %Point A
    r4Ax = r1Ax - r1;
    r4Ay = r1Ay;

    %Thetat 4 : G
    D = CosLaw(r1, r2, 180 - T2);
    C1 = SinLaw(r2, D, 180 - T2);
    C2 = RevCosLaw(r4, D, r3);
    G = C1+C2;

    
    %r4 Point B
    r4Bx = r4Ax + r4 * cos(G);
    r4By = r4Ay + r4 * sin(G);
    
    %Solve for r3 Point B
    r3Bx = r4Bx;
    r3By = r4By;
    
    %Velocity Analysis%%%%%%%%%%%%%%%%%%%%%%%%%%
    %Takes the Derivative of r2B and multiplies by W for chain rule
    % the double/vpa is just typecating
    Vx2 = W * double(vpa(subs(diff(r2Bx),T2 ,Angle *W)));
    Vy2 = W * double(vpa(subs(diff(r2By),T2 ,Angle*W)));
    V2 = sqrt(Vx2^2 + Vy2^2);
    w2 = V2 / r2;
    
%Takes the Derivative of r3B and multiplies by W for chain rule
    Vx3 = W * double(subs(diff(r3Bx),T2 ,Angle*W));
    Vy3 = W * double(subs(diff(r3By),T2 ,Angle*W));
    V3 = sqrt(Vx3^2 + Vy3^2);
    w3 = V3 / r3;
    
    
    
    
    
    %Translational matrices from other file, now applied to the velocity
    %aswell
        Rise = FrameBy - FrameAy;
        Run = FrameBx - FrameAx;
        RotationAngle = atan2d(Rise, -1 * Run);
        
        A = [r1Ax, r2Bx, r3Bx, r4Ax;r1Ay, r2By, r3By, r4Ay]';
        V = [Vx2, Vx3;Vy2, Vy3]';
        if FlipX == 1
        A = A * [1, 0; 0, -1];
         V = V * [1, 0; 0, -1];
        end
        if FlipY == 1
        A = A * [-1, 0; 0, 1];
        V = V * [-1, 0; 0, 1];
        end
        R = [cosd(RotationAngle), -sind(RotationAngle); ...
        sind(RotationAngle), cosd(RotationAngle)];
        A = A * R;
        

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
    
         V = V * R;
        Vx2 = V(1,1);
        Vy2 = V(1,2);
        Vx3 = V(2,1);
        Vy3 = V(2,2);
        
        
        if 1==2
        Mat = [r4Ax, r4Ay ; r4Bx, r4By];
            Mat = diff(Mat);
            norm(Mat)
        end
end

%Trig functions
function [c] = CosLaw(a, b, Theta)
    c = sqrt(a^2 + b^2 - 2 * a * b * cos(Theta));
end

function [Theta] = RevCosLaw (a, b, c)
    Theta = acos((c^2 - a^2 - b^2) / (-2 * a * b));
end

function [ThetaA] = SinLaw(A, B, SinB)
    ThetaA = asin(A * sin(SinB) / B);
end 

