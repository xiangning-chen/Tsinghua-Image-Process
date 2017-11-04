function f = hide_time_domain(img, str)

% input:
% img: image used to hide info
% str: string, info
% output:
% f: hidden image

EOF = '###';
str = [str, EOF];
f = dec2bin(reshape(double(img),1,[]), 8);
info = reshape(dec2bin(double(str),8)', 1, []);

f(1:length(info),end) = info;
f = reshape(bin2dec(f),size(img,1),size(img,2),[]);
f = uint8(f);

% imwrite(f, 'hide_time_domain.jpg');

end