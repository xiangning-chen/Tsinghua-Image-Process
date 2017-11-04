function f = hide_fre_domain_1(C, str)

% input:
% C: DCT metric
% str: string, info
% output:
% f: DCT metric with hidden info

EOF = '###';
str = [str, EOF];
C_tmp = reshape(C, 1, []);
bin = dec2bin(C_tmp+128,8);
info = reshape(dec2bin(double(str),8)', 1, []);
bin(1:length(info),end) = info;

f = [];
for i = 1:size(bin,1)
   f = [f, bin2dec(bin(i,:))-128];
end
f = reshape(f,size(C,1),size(C,2),[]);

end
