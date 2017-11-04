function f = zigzag(A)

% input: A: right metric
% output: zigzag of A

judge = mod(size(A,1),2)+1;
if judge == 1
    another = 2;
else
    another = 1;
end
total = size(A,1)^2;
direction = [0,1;1,-1;1,0;-1,1];
step = 1; mark = 1; flag = 1; num = 0;
result = [];
current = [1,1];

while num < total
    if mod(flag, 2) == 1
        len = 1;
    else
        len = step;
        if len == size(A,1)-1
            mark = 0;
        end
        if mark
            step = step + 1;
        else
            step = step - 1;
        end
    end
    for i = 1:len
        result = [result, A(round(current(1)),round(current(2)))];  
        if current(judge) == size(A,1) && current(another) == 1
            direction(1,1) = 1;
            direction(1,2) = 0;
            direction(3,1) = 0;
            direction(3,2) = 1;
        end
        current(1) = current(1) + direction(flag, 1);
        current(2) = current(2) + direction(flag, 2);   
        num = num + 1;
        if num == total
            break;
        end
    end
    flag = mod(flag+1, 4);
    if flag == 0
        flag = 4;
    end
end
f = result;
end