function DrawLink(X1, X2, Y1, Y2)
       
       %Define Link Coordicates;
        LinkX = [X1, X2];
        LinkY = [Y1, Y2];
        
        %Draw Links
        line(LinkX, LinkY, 'Marker', 'o', 'LineWidth' , .5, 'color', 'b')
        %line(LinkX, LinkY, 'Marker', 'o', 'LineWidth' , 10, 'color', 'k')

end

