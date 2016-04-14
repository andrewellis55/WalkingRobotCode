%Initialises total weight to 0
TotalWeight = 0;
%Adds weight iteratively
for legNum = 1:4
    for linkNum = 1:11
        Leg(legNum).Link(linkNum).Length = LinkLength(linkNum);
        %Numbers based on experimaental values from Catia graphed in excel
        Leg(legNum).Link(linkNum).Weight = LinkLength(linkNum) * 2.0964 * 10 ^ -5 +  0.0002816285;
        TotalWeight = TotalWeight + Leg(legNum).Link(linkNum).Weight;
    end
end
 
%Accounting for weight of other stuff like the motor and bolts
TotalWeight = TotalWeight + 0.171465;
NetForce = TotalWeight * 9.8;
