function f = My_dec2bin(x, len)

if nargin == 1
    f = dec2bin(abs(x));
else
    f = dec2bin(abs(x),len);
end
if x < 0
    for i = 1:length(f)
        if f(i) == '1'
            f(i) = '0';
        else
            f(i) = '1';
        end
    end
end
end