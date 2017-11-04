function f = is_overlap(x,y)

boarderx = [x(1)-x(3)/2, x(1)+x(3)/2, x(2)-x(4)/2, x(2)+x(4)/2];
boardery = [y(1)-y(3)/2, y(1)+y(3)/2, y(2)-y(4)/2, y(2)+y(4)/2];

overlapH = (boarderx(1)<=boardery(1) && boardery(1)<=boarderx(2)) || (boarderx(1)<=boardery(2) && boardery(2)<=boarderx(2));
overlapW = (boarderx(3)<=boardery(3) && boardery(3)<=boarderx(4)) || (boarderx(3)<=boardery(4) && boardery(4)<=boarderx(4));
if overlapH && overlapW 
    f = 1;
else
    f = 0;
end

end
