% stepRadius = 0;
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
%     stepRadius = stepRadius + DiffLength;
%    
% %     StepData(r, 1) = SF;
% %     StepData(r, 2) = stepRadius;
%    
% end
% stepRadius


stepRadius = 0.149 * SF;