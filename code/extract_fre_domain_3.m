function str = extract_fre_domain_3(C)

% input:
% C: DCT metric with hidden info
% output:
% str: string, info

EOF = reshape(dec2bin(double('###'),8)', 1, []);
EOF = 2 * (EOF - '0') - 1;
s = [];
for i = 1:size(C,2)
    for j = size(C,1):-1:1
        if C(j,i) ~= 0
            s = [s, C(j,i)];
            break;
        end
    end
end
len = -1;
for i = 1:length(s)-23
    if s(i:i+23) == EOF
        len = i - 1;
        break;
    end
end
s = (reshape(s(1:len),8,[])' + 1) / 2;
str = [];
for i = 1:size(s,1)
    tem = [];
    for j = 1:size(s,2)
        tem = [tem, int2str(s(i,j))];   
    end
    str = [str, char(bin2dec(tem))];
end

end