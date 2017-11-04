function str = extract_fre_domain_1(C)

% input:
% C: DCT metric with hidden info
% output:
% str: string, info

EOF = reshape(dec2bin(double('###'),8)', 1, []);
C_tmp = reshape(C, 1, []);
bin = dec2bin(C_tmp+128,8);

last = bin(:, end)';
len = -1;
for i = 1:length(last)-23
    if strcmp(last(i:i+23),EOF)
        len = i - 1;
        break;
    end
end
str = reshape(bin(1:len, end), 8, [])';
str = char(bin2dec(str))';

end