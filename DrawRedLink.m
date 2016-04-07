function DrawRedLink(X1, X2, Y1, Y2)
       
       %Define Link Coordicates;
        LinkX = [X1, X2];
        LinkY = [Y1, Y2];
        
        %Draw Links
        line(LinkX, LinkY, 'Color', 'r')


end

