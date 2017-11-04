function f = My_bin2dec(x)

is_neg = 0;
if strcmp(x(1), '0')
    is_neg = 1;
    for i = 1:length(x)
        if strcmp(x(i),'0')
            x(i) = '1';
        else
            x(i) = '0';
        end
    end
end

f = bin2dec(x);
if is_neg
    f = -f;
end

end