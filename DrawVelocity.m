function DrawVelocity(a_Leg, a_Joint, a_Link, a_Pos, T)
       
        %Enable access to Leg coordiantes
        global Leg
        X = 1; Y = 2;
        
        %Begins Vector at the joint
        X1 = Leg(a_Leg).Link(a_Link).Pos(a_Pos).Cor(X).Rev(T);
        %Entends to Joint + velocity
        X2 = X1 + Leg(a_Leg).Joint(a_Joint).Vx.Rev(T);
        
        %Same as for X
        Y1 = Leg(a_Leg).Link(a_Link).Pos(a_Pos).Cor(Y).Rev(T);
        Y2 = Y1 + Leg(a_Leg).Joint(a_Joint).Vy.Rev(T);
        
       %Define Link Coordicates;
        LinkX = [X1, X2];
        LinkY = [Y1, Y2];
        
        %Draw Links
        line(LinkX, LinkY, 'Color', 'r')


end

