function f = hide_fre_domain_3(C, str)

% input:
% C: DCT metric
% str: string, info
% output:
% f: DCT metric with hidden info

EOF = '###';
str = [str, EOF];
info = reshape(dec2bin(double(str),8)', 1, []);
info = 2 * (info - '0') - 1;

for i = 1:length(info)
    for j = size(C,1):-1:1
        if C(j,i) ~= 0
            if j == size(C,1)
                C(j,i) = info(i);
            else
                C(j+1,i) = info(i);
            end
            break;
        end
    end
end
f = C;

end