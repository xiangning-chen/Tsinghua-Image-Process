function [axisH, axisW, lenH, lenW] = overlap(x,y)

boarderx = [x(1)-x(3)/2, x(1)+x(3)/2, x(2)-x(4)/2, x(2)+x(4)/2];
boardery = [y(1)-y(3)/2, y(1)+y(3)/2, y(2)-y(4)/2, y(2)+y(4)/2];

minH = min(boarderx(1),boardery(1));
maxH = max(boarderx(2),boardery(2));
minW = min(boarderx(3),boardery(3));
maxW = max(boarderx(4),boardery(4));
lenH = maxH - minH;
lenW = maxW - minW;

if minH == boarderx(1) && maxH == boarderx(2)
    axisH = x(1);
elseif minH == boardery(1) && maxH == boardery(2)
    axisH = y(1);
else
    axisH = round((x(1)+y(1))/2);
end

if minW == boarderx(3) && maxW == boarderx(4)
    axisW = x(2);
elseif minW == boardery(3) && maxW == boardery(4)
    axisW = y(2);
else
    axisW = round((x(2)+y(2))/2);
end

end