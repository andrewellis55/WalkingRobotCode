  %1st Leg
        %Solve for ground Link
        groundBx = LegStartX(2) + FixBx;
        groundBy = LegStartY(2) - FixBy;

        if 1==1
            %Solving First FourBar Linkage
            [Leg(2).Link(1).Pos(A).Cor(X).Rev(T), ...
                Leg(2).Link(1).Pos(A).Cor(Y).Rev(T), ...
                Leg(2).Link(1).Pos(B).Cor(X).Rev(T), ...
                Leg(2).Link(1).Pos(B).Cor(Y).Rev(T),...
                Leg(2).Link(2).Pos(A).Cor(X).Rev(T),...
                Leg(2).Link(2).Pos(A).Cor(Y).Rev(T),...
                Leg(2).Link(2).Pos(B).Cor(X).Rev(T),...
                Leg(2).Link(2).Pos(B).Cor(Y).Rev(T),...
                Leg(2).Link(3).Pos(A).Cor(X).Rev(T),...
                Leg(2).Link(3).Pos(A).Cor(Y).Rev(T),...
                Leg(2).Link(3).Pos(B).Cor(X).Rev(T),...
                Leg(2).Link(3).Pos(B).Cor(Y).Rev(T)] = ...
                RockerCrankSolve( groundBx,   groundBy, ...
                LegStartX(2),       LegStartY(2), ...
                FixedPointDist, LinkLength(1), ...
                LinkLength(2),  LinkLength(3), T , FlipX, Norm, 180+ 23.19919044);

        end

        if 1 ==1
            %Solving Second FourBar Linkage
            [Temp5, Temp6, Temp7, Temp8, ...
                Leg(2).Link(4).Pos(A).Cor(X).Rev(T),...
                Leg(2).Link(4).Pos(A).Cor(Y).Rev(T),...
                Leg(2).Link(4).Pos(B).Cor(X).Rev(T),...
                Leg(2).Link(4).Pos(B).Cor(Y).Rev(T),...
                Leg(2).Link(5).Pos(A).Cor(X).Rev(T),...
                Leg(2).Link(5).Pos(A).Cor(Y).Rev(T),...
                Leg(2).Link(5).Pos(B).Cor(X).Rev(T),...
                Leg(2).Link(5).Pos(B).Cor(Y).Rev(T)] = ...
               CrankRockerSolve( groundBx,   groundBy, ...
                LegStartX(2),       LegStartY(2),...
                FixedPointDist, LinkLength(1), ...
                LinkLength(4),  LinkLength(5), T+ 23.19919044, Norm, Norm, 180+ 23.19919044);
        end



        if 3==3
            %Solve First 3 Bar
            [Temp1, Temp2, Temp3, Temp4, ...
                Leg(2).Link(7).Pos(A).Cor(X).Rev(T),...
                Leg(2).Link(7).Pos(A).Cor(Y).Rev(T),...
                Leg(2).Link(7).Pos(B).Cor(X).Rev(T),...
                Leg(2).Link(7).Pos(B).Cor(Y).Rev(T),...
                Leg(2).Link(6).Pos(A).Cor(X).Rev(T),...
                Leg(2).Link(6).Pos(A).Cor(Y).Rev(T),...
                Leg(2).Link(6).Pos(B).Cor(X).Rev(T),...
                Leg(2).Link(6).Pos(B).Cor(Y).Rev(T)] ...
                = ThreeBarSolveFlip(Leg(2).Link(3).Pos(B).Cor(X).Rev(T),...
                Leg(2).Link(3).Pos(B).Cor(Y).Rev(T),...
                Leg(2).Link(3).Pos(A).Cor(X).Rev(T),...
                Leg(2).Link(3).Pos(A).Cor(Y).Rev(T),...
                LinkLength(3), LinkLength(7), LinkLength(6));
        end

        if 4==4
            %Solving Third FourBar Linkage Using MultiDependancy Solver
            %(uses cordinates from input plus moving frame)

            [Temp1, Temp2, Temp3, Temp4, ...
                Temp5, Temp6, Temp7, Temp8, ...
                Leg(2).Link(9).Pos(A).Cor(X).Rev(T),...
                Leg(2).Link(9).Pos(A).Cor(Y).Rev(T),...
                Leg(2).Link(9).Pos(B).Cor(X).Rev(T),...
                Leg(2).Link(9).Pos(B).Cor(Y).Rev(T),...
                Leg(2).Link(8).Pos(A).Cor(X).Rev(T),...
                Leg(2).Link(8).Pos(A).Cor(Y).Rev(T),...
                Leg(2).Link(8).Pos(B).Cor(X).Rev(T),...
                Leg(2).Link(8).Pos(B).Cor(Y).Rev(T)] = ...
                MultiDependancyFourBarSolve( Leg(2).Link(6).Pos(A).Cor(X).Rev(T),...
                Leg(2).Link(6).Pos(A).Cor(Y).Rev(T), ...
                Leg(2).Link(6).Pos(B).Cor(X).Rev(T), ...
                Leg(2).Link(6).Pos(B).Cor(Y).Rev(T), ...
                Leg(2).Link(5).Pos(B).Cor(X).Rev(T),...
                Leg(2).Link(5).Pos(B).Cor(Y).Rev(T), ...
                Leg(2).Link(5).Pos(A).Cor(X).Rev(T), ...
                Leg(2).Link(5).Pos(A).Cor(Y).Rev(T), ...
                LinkLength(6), LinkLength(5), ...
                LinkLength(9),  LinkLength(8), FlipX, Norm);
        end
        if 5==5

            %Solve Seconde 3 Bar
            [Temp1, Temp2, Temp3, Temp4, ...
                Leg(2).Link(10).Pos(A).Cor(X).Rev(T),...
                Leg(2).Link(10).Pos(A).Cor(Y).Rev(T),...
                Leg(2).Link(10).Pos(B).Cor(X).Rev(T),...
                Leg(2).Link(10).Pos(B).Cor(Y).Rev(T),...
                Leg(2).Link(11).Pos(A).Cor(X).Rev(T),...
                Leg(2).Link(11).Pos(A).Cor(Y).Rev(T),...
                Leg(2).Link(11).Pos(B).Cor(X).Rev(T),...
                Leg(2).Link(11).Pos(B).Cor(Y).Rev(T)] ...
                = ThreeBarSolveFlip(Leg(2).Link(9).Pos(B).Cor(X).Rev(T),...
                Leg(2).Link(9).Pos(B).Cor(Y).Rev(T),...
                Leg(2).Link(9).Pos(A).Cor(X).Rev(T),...
                Leg(2).Link(9).Pos(A).Cor(Y).Rev(T),...
                LinkLength(9), LinkLength(10), LinkLength(11));
        end