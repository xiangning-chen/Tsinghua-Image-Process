function u = get_u(img, L)

% input:
% img: metric, image region
% L: int, choice of total color
% output:
% u: [2^(3*L),1] vector

img = double(img);
[H, W, C] = size(img);
N = 2^(3*L);
u = zeros(1, N);

for i = 1:H
    for j = 1:W
        RGB = dec2bin(img(i,j,:),8);
        tem = [];
        for k = 1:C
            tem = [tem, RGB(k,1:L)];
        end
        u(bin2dec(tem)+1) = u(bin2dec(tem)+1) + 1;
    end
end

u = u' / H / W;
end