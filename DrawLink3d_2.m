function DrawLink3d_2(X1, X2, Y1, Y2)
       
       %Define Link Coordicates;
        LinkX = [X1, X2];
        LinkZ = [Y1, Y2];
        LinkY = [-70 , -70];
        %Draw Links
        
        line(LinkX, LinkY, LinkZ, 'Marker', 'o', 'color', 'w', 'linewidth', 2.5)
        line(LinkX, LinkY, LinkZ, 'Marker', 'o', 'color', 'b')

end

