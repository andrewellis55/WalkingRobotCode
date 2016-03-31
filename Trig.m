function [c] = CosLaw[a, b, Theta]
    c = sqrt(a^2 + b^2 - 2 * a * b * cosd(Theta));
end

function [Theta] = RevCosLaw [a, b, c]
    Theta = acosd((c^2 - a^2 - b^2) / (-2 * a * b));
end

function [ThetaA] = SinLaw[A, B, SinB]
    ThetaA = asind(A * sind(SinB) / B);
end 

function [A] = RevSinLaw[B, SinA, SinB]
    A = B * sind(SinA) / sind(SinB);
end 