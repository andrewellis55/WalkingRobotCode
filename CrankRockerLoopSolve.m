function [r2Ax, r2Ay, r2Bx, r2By, r3Ax, r3Ay, r3Bx, r3By, r4Ax, r4Ay, r4Bx, r4By, V1, V2, V3, V4] = CrankRockerLoopSolve( FrameAx, FrameAy, FrameBx, FrameBy, r1, r2, r3, r4, T2, FlipX, FlipY)

    if FlipX == 1
        T2 = T2 * -1;
    end
    
    %expd is not a matlab function, I made it to input imaginairy numbers
    %in degrees
    Vec1 = r1 * expd(180 * 1i);
    Vec2 = r2 * expd(T2 * 1i);
    
    %Solve T3
    a3 = 2 * r2 * r3 * cosd(T2) - 2 * r1 * r3;
    b3 = 2 * r2 * r3 * sind(T2);
    d3 = r4^2 - r1^2 - r2^2 - r3^2 + 2 * r1 * r2 * cosd(T2);
    R3 = sqrt(a3^2 + b3^2);
    alpha3 = atand(b3/a3);
    T3 = acosd(d3/R3) + alpha3;
    
    %Solve T4
    a4 = -2 * r2 * r4 * cosd(T2) + 2 * r1 * r4;
    b4 = -2 * r2 * r4 * sind(T2);
    d4 = r3^2 - r1^2 - r2^2 - r4^2 + 2 * r1 *r2 * cosd(T2);
    R4 = sqrt(a4^2 + b4^2);
    alpha4 = atand(b4 / a4);
    T4 = acosd(d4 / R4) + alpha4;
    
    Vec3 = r3 * expd(T3 * 1i);
    Vec4 = r4 * expd((T4 - 180) * 1i);
    
    r1Ax = real(Vec1);
    r1Ay = imag(Vec1);
    
    r1Bx = 0;
    r1By = 0;
    
    r2Ax = 0;
    r2Ay = 0;
    
    r2Bx = real(Vec2);
    r2By = imag(Vec2);
    
    r3Ax = real(Vec2);
    r3Ay = imag(Vec2);
    
    r3Bx = real(Vec2 + Vec3);
    r3By = imag(Vec2 + Vec3);
    
    r4Ax = real(Vec2 + Vec3);
    r4Ay = imag(Vec2 + Vec3);
    
    r4Bx = real(Vec2 + Vec3 + Vec4);
    r4By = imag(Vec2 + Vec3 + Vec4);
    
    
    
    
    %Rotate
    if 1==2
        Rise = FrameBy - FrameAy;
        Run = FrameBx - FrameAx;
        RotationAngle = atan2d(Rise, -1 * Run);
        
        A = [r2Ax, r3Ax, r4Ax, r1Ax ;r2Ay, r3Ay, r4Ay, r1Ay]';
        if FlipX == 1
        A = A * [1, 0; 0, -1];
        end
        if FlipY == 1
        A = A * [-1, 0; 0, 1];
        end
        R = [cosd(RotationAngle), -sind(RotationAngle); ...
        sind(RotationAngle), cosd(RotationAngle)];
        A = A * R;
        
        transX = FrameBx;
        transY = FrameBy;
        A = A + [transX, transX, transX, transX;transY,transY,transY,transY]';
        r2Ax = A(1,1);
        r2Ay = A(1,2);
        r3Ax = A(2,1);
        r3Ay = A(2,2);
        r4Ax = A(3,1);
        r4Ay = A(3,2);
        r1Ax = A(4,1);
        r1Ay = A(4,2);

        r1Bx = r2Ax;
        r1By = r2Ay;
        r2Bx = r3Ax;
        r2By = r3Ay;
        r3Bx = r4Ax;
        r3By = r4Ay;
        r4Bx = r1Ax;
        r4By = r1Ay;
    
        
        if 1==2
        Mat = [r4Ax, r4Ay ; r4Bx, r4By];
            Mat = diff(Mat);
            norm(Mat)
        end
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

