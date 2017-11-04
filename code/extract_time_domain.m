function str = extract_time_domain(img)

% input: 
% img: image with hidden info
% ouput:
% str: hidden info

img = dec2bin(reshape(double(img),1,[]), 8);
EOF = reshape(dec2bin(double('###'),8)', 1, []);

last = img(:,end)';
len = -1;
for i = 1:length(last)-23
    if strcmp(last(i:i+23),EOF)
        len = i - 1;
        break;
    end
end
str = reshape(img(1:len, end), 8, [])';
str = char(bin2dec(str))';

end