TotalWeight = 0;
for legNum = 1:4
    for linkNum = 1:11
        Leg(legNum).Link(linkNum).Length = LinkLength(linkNum);
        Leg(legNum).Link(linkNum).Weight = LinkLength(linkNum) * 2.0964 * 10 ^ -5 +  0.0002816285;
        TotalWeight = TotalWeight + Leg(legNum).Link(linkNum).Weight;
    end
end
 
%Accounting for weight of other stuff
TotalWeight = TotalWeight + 0.171465;
NetForce = TotalWeight * 9.8;
