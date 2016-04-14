%Comment out code generated data that was brought into excel. The data was
%curve fitted in excel to give an approximate trend of Step Circumference
%being 0.149 * SF


%Solves for Step Circumfernce Data to be brought into excel. The Step length is approx 0.5 * Step Circumfernce
%
% stepCircumference = 0;
% for stepAngleItr = 1: quality
%     stepAngle = (stepAngleItr * 360 / quality) + 180;
%     if stepAngle == 0
%         itrMinusOne = 360;
%     else
%         itrMinusOne = stepAngle - 1;
%     end
%     
%     
%     Link11_CoodinateMatrix  = [Leg(1).Link(11).Pos(A).Cor(X).Rev(itrMinusOne) , ...
%         Leg(1).Link(11).Pos(A).Cor(Y).Rev(itrMinusOne) ; ...
%         Leg(1).Link(11).Pos(A).Cor(X).Rev(stepAngle) , ...
%         Leg(1).Link(11).Pos(A).Cor(Y).Rev(stepAngle)]'
%     Link11_CoodinateMatrix = diff(Link11_CoodinateMatrix)
%     DiffLength = abs(norm(Link11_CoodinateMatrix)) / 10000
%     SSSSSSS = stepAngle;
%     stepCircumference = stepCircumference + DiffLength;
%    
% %     StepData(r, 1) = SF;
% %     StepData(r, 2) = stepCircumference;
%    
% end
% stepCircumference

%0.149 is based on an excel simulation of the above code
stepRadius = 0.149 * SF;