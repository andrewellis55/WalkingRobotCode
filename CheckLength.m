function [ Length ] = CheckLength( L)

        %This function returns the legth of a desired link
        Mat = [Leg(1).Link(L).Pos(A).Cor(X).Rev(T) , Leg(1).Link(L).Pos(A).Cor(Y).Rev(T) ; Leg(1).Link(L).Pos(B).Cor(X).Rev(T) , Leg(1).Link(L).Pos(B).Cor(Y).Rev(T)];
        Mat = diff(Mat);
        Lenght = norm(Mat);


end

