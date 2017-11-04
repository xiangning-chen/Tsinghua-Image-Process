function f = merge(record, error, sideH, sideW, dir)

formerlen = size(record,1);
latterlen = -1;
while latterlen ~= formerlen
    formerlen = size(record,1);
    pos = 1;
    flag = 2;
    while pos <= size(record,1) - 1
        dis = sqrt((record(pos,1)-record(flag,1))^2+(record(pos,2)-record(flag,2))^2);
        if dir == 1
            judge = dis < error && is_overlap(record(pos,:),record(flag,:));
        elseif dir == 2
            judge = dis < error + 8 && is_overlap(record(pos,:),record(flag,:));
        end
        if judge
            [record(pos,1),record(pos,2),record(pos,3),record(pos,4)] = overlap(record(pos,:),record(flag,:));
            record(flag,:) = [];
        else
            flag = flag + 1;
        end
        if flag > size(record,1)
            pos = pos + 1;
            flag = pos + 1;
        end
        size(record,1);
    end
    latterlen = size(record,1);
end  
f = [];
for i = 1:size(record,1)
    if record(i,3)~=sideH || record(i,4)~=sideW
        f = [f;record(i,:)];
    end
end
f = round(f);
end