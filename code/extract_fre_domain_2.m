function str = extract_fre_domain_2(C)

% input:
% C: DCT metric with hidden info
% output:
% str: string, info

EOF = reshape(dec2bin(double('###'),8)', 1, []);
C_tmp = reshape(C, 1, []);
bin = dec2bin(C_tmp+128,8);

flag = -1;
for i = 1:fix((length(bin)-8)/150)-23
    tmp = [];
    for j = i:i+23
        tmp = [tmp, bin(150*j+8,end)];
    end
    if strcmp(tmp, EOF)
        flag = i - 1;
        break;
    end
end
        
str = [];
for i = 1:flag
    str = [str, bin(i*150+8,end)];
end
str = reshape(str, 8, [])';
str = char(bin2dec(str))';

end
